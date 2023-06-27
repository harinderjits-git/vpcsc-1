locals {
  env_config     = yamldecode(file("${get_terragrunt_dir()}/../../config_env_sampleapp.yaml"))
  network         = yamldecode(file("${get_terragrunt_dir()}/../../core-prod-networks.yaml"))
}

terraform {
  source = "../../../../modules/service_projects"
  
}

inputs = {
  parent          = local.env_config.global.host_project.parent
  billing_account = local.env_config.global.billing_account
  services        = local.env_config.global.services
  host_project    = local.env_config.global.host_project.name
  service_projects = local.env_config.global.service_projects
  labels = local.env_config.global.labels
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
 #   experiments = [module_variable_optional_attrs]
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=4.48.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">=4.48.0"
    }
  }
  required_version = ">=1.2.3"
}
EOF
}


include {
  path = find_in_parent_folders()
}
