locals {
  env_config     = yamldecode(file("${get_terragrunt_dir()}/../../config_env_sampleapp.yaml"))
  network         = yamldecode(file("${get_terragrunt_dir()}/../../core-prod-networks.yaml"))
}

dependency xvpc {
  config_path = "../svpc_network"
}

terraform {
  source = "../../../../modules/vpcsc"
  
}

inputs = {
project_id=local.env_config.global.host_project.name
parent_id = local.env_config.vpcsc.parent_org_id
policy_name =local.env_config.vpcsc.access_policy_name
host_network= dependency.xvpc.outputs.network_id
protected_project_ids = local.env_config.vpcsc.protected_project_ids
#protected_vpcn = local.env_config.vpcsc.protected_vpcn
protect_xvpc = local.env_config.vpcsc.protect_xvpc
ip_subnetworks = local.env_config.vpcsc.access_level.allowed_subnets
members = []
regions = []
restricted_services = local.env_config.vpcsc.restricted_services
perimeter_name  = local.env_config.vpcsc.perimeter_name
access_level_name  = local.env_config.vpcsc.access_level.name
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
