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

