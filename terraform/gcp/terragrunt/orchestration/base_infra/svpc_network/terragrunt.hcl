locals {
  env_config     = yamldecode(file("${get_terragrunt_dir()}/../../config_env_sampleapp.yaml"))
  network         = yamldecode(file("${get_terragrunt_dir()}/../../core-prod-networks.yaml"))
  environment = local.env_config.prod_workloads.prd
}

terraform {
  source = "../../../../modules/network"
  
}

inputs = {
  owner                          = local.env_config.global.owner
  billing_account                = local.env_config.global.billing_account
  parent                         = local.env_config.global.host_project.parent
  networks                       = local.network.internal.networks
  environment                    = local.environment.name[0]
  region                         = local.env_config.global.regions[0]
  department_code                = "DEV"
  project                        = local.env_config.global.host_project.id
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
