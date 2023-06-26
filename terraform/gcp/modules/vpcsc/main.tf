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
}


module "regular_service_perimeter_1" {
  source         = "./gcp-vpc-sc/modules/regular_service_perimeter"
  policy         = module.access_context_manager_policy.policy_id
  perimeter_name = var.perimeter_name
  description    = "Perimeter shielding  project"
  resources      = local.protected_vpcn == null ? var.protected_project_ids : concat(var.protected_project_ids, tolist(["${local.protected_vpcn}"]))
  #resources     = var.protected_project_ids
  access_levels = [module.access_level_members.name]

  restricted_services = var.restricted_services

  ingress_policies = [
    {
      "from" = {
        "sources" = {
          access_levels = [module.access_level_members.name] # Allow Access from everywhere
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
