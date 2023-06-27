provider "google" {
  project               = var.project_id
  billing_project       = var.project_id
  user_project_override = true
}

module "access_context_manager_policy" {
  source      = "./gcp-vpc-sc"
  parent_id   = var.parent_id
  policy_name = var.policy_name
}

data google_project p_project_id {
  for_each = {for i in (var.protected_project_ids): i=>i }
  project_id = each.value
}
module "access_level_members" {
  source         = "./gcp-vpc-sc/modules/access_level"
  description    = "Simple Example Access Level"
  policy         = module.access_context_manager_policy.policy_id
  name           = var.access_level_name
  members        = var.members
  regions        = var.regions
  ip_subnetworks = var.ip_subnetworks
}

resource "null_resource" "wait_for_members" {
  provisioner "local-exec" {
    command = "sleep 60"
  }

  depends_on = [module.access_level_members]
}


locals {
  protected_vpcn = var.protect_xvpc == true ? var.host_network : null
  p_project_list            = [ for key,value in merge(data.google_project.p_project_id.*...):  value.number]
  #p_project_list = [for r in local.pfn : "${r.name}.${r.zone_name}"]
}


module "regular_service_perimeter_1" {
  source         = "./gcp-vpc-sc/modules/regular_service_perimeter"
  policy         = module.access_context_manager_policy.policy_id
  perimeter_name = var.perimeter_name
  description    = "Perimeter shielding  project"
  resources      = local.protected_vpcn == null ? local.p_project_list : concat(local.p_project_list, tolist(["${local.protected_vpcn}"]))
  access_levels = [module.access_level_members.name]

  restricted_services = var.restricted_services

  ingress_policies = [
    {
      "from" = {
        "sources" = {
          access_levels = [module.access_level_members.name] # Allow Access from access level only
        },
        "identities" = var.members
      }
      "to" = {
        "resources" = ["*"]
        "operations" = {
          #services = "*"
        }
        # "operations" = {
        #   "storage.googleapis.com" = {
        #     "methods" = [
        #       "google.storage.objects.get",
        #       "google.storage.objects.list"
        #     ]
        #   }
        # }
      }
    },
  ]
  vpc_accessible_services = ["RESTRICTED-SERVICES"]

  shared_resources = {
    all = var.protected_project_ids
  }

}


# output "name" {
#   value = local.p_project_list
# }