provider "google" {
  project               = var.project_id
  billing_project       = var.project_id
  user_project_override = true
}

data "google_project" "p_project_id" {
  for_each   = { for i in(var.protected_project_ids) : i => i }
  project_id = each.value
}


data "google_project" "egress_project_id" {
  for_each   = { for i in(var.allowed_egress_projects) : i => i }
  project_id = each.value
}
data "google_project" "ingress_project_id" {
  for_each   = { for i in(var.allowed_ingress_projects) : i => i }
  project_id = each.value
}

locals {
  protected_vpcn       = var.protect_xvpc == true ? var.host_network : null
  p_project_list       = [for key, value in merge(data.google_project.p_project_id.*...) : value.number]
  egress_project_list  = [for key, value in merge(data.google_project.egress_project_id.*...) : "projects/${value.number}" if length(var.allowed_egress_projects) > 0 && contains(var.allowed_egress_projects, value.project_id)]
  ingress_project_list = [for key, value in merge(data.google_project.ingress_project_id.*...) : "projects/${value.number}" if length(var.allowed_ingress_projects) > 0 && contains(var.allowed_ingress_projects, value.project_id)]
  #  egress_project_list = [for r in var.allowed_egress_projects: "projects/${r}" if length(var.allowed_egress_projects) > 0 ]
}


module "regular_service_perimeter_1" {
  source         = "./gcp-vpc-sc/modules/regular_service_perimeter"
  policy         = var.policy_id
  perimeter_name = var.perimeter_name
  description    = "Perimeter shielding  project ${var.perimeter_name}"
  resources      = local.protected_vpcn == null ? local.p_project_list : concat(local.p_project_list, tolist(["${local.protected_vpcn}"]))
  access_levels  = [var.access_level_name]

  restricted_services = var.restricted_services

  ingress_policies = [
    {
      "from" = {
        "sources" = {
          access_levels = [var.access_level_name] # Allow Access from access level only
          resources = length(var.allowed_ingress_projects) == 0 ? [] : local.ingress_project_list
        },
        "identities" = var.members
       #identity_type = "ANY_IDENTITY" #IDENTITY_TYPE_UNSPECIFIED, ANY_IDENTITY, ANY_USER_ACCOUNT, ANY_SERVICE_ACCOUNT.
      }
      "to" = {
        "resources" = ["*"]
        "operations" = {
          "*"  = {}
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
  egress_policies = length(var.allowed_egress_projects) == 0 ? [] : [
    {
      "from" = {
        "identities" = var.members
          #identity_type = "ANY_IDENTITY" #IDENTITY_TYPE_UNSPECIFIED, ANY_IDENTITY, ANY_USER_ACCOUNT, ANY_SERVICE_ACCOUNT.
      }
      "to" = {
        "resources" = local.egress_project_list
        "operations" = {
          "*"  = {}
        }
      }
    },
  ]

  vpc_accessible_services = ["RESTRICTED-SERVICES"]

  shared_resources = {
    all = var.protected_project_ids
  }

}


output "name" {
  value = local.ingress_project_list
}
