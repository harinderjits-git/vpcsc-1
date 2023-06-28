locals {
  env_config     = yamldecode(file("${get_terragrunt_dir()}/../../config_env_sampleapp.yaml"))
  network         = yamldecode(file("${get_terragrunt_dir()}/../../core-prod-networks.yaml"))
}

dependency xvpc {
  config_path = "../svpc_network"
}

dependency svpc_attach {
  config_path = "../svpc_attach"
   skip_outputs = true
}

terraform {
  source = "../../../../modules/vpcsc_policy"
  
}


inputs = {
project_id=local.env_config.global.host_project.name
parent_id = local.env_config.vpcsc.parent_org_id
policy_name =local.env_config.vpcsc.access_policy_name
host_network= dependency.xvpc.outputs.network_id
ip_subnetworks = local.env_config.vpcsc.access_level.allowed_subnets
members = local.env_config.vpcsc.allowed_identities
regions = local.env_config.vpcsc.access_level.allowed_regions
access_level_name  = local.env_config.vpcsc.access_level.name
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
