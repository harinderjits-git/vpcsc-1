locals {
  #platform_config = yamldecode(file(format("%s/%s", get_env("MAIN_CONFIG_PATH"), get_env("MAIN_CONFIG_FILE_NAME"))))
  env_config      = yamldecode(file(format("%s/%s", get_env("MAIN_CONFIG_PATH"), get_env("ENV_CONFIG_FILE_NAME"))))
  environment = local.env_config.prod_workloads.prd
  network         = yamldecode(file("${get_terragrunt_dir()}/../../core-prod-networks.yaml"))
}
dependency vpc {
  config_path = "../../base_infra/svpc_network"
  skip_outputs = true
}
terraform {
  source = "../../../../modules/gcemodule"
}


inputs = {
subnetwork_project =local.env_config.global.host_project.name
subnetwork = local.environment.gce.subnetwork.name
project_id= local.environment.gce.project_name
hostname =  "${local.env_config.global.name_prefix[0]}${local.environment.name[0]}${local.environment.gce.name[0]}"
region = local.environment.region

  labels     = merge(local.env_config.global.labels, local.environment.labels)
}


generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
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
