locals {
  env_config     = yamldecode(file("${get_terragrunt_dir()}/../../config_env_sampleapp.yaml"))
  network         = yamldecode(file("${get_terragrunt_dir()}/../../core-prod-networks.yaml"))
}

dependency vpcscpolicy {
  config_path = "../vpcsc_policy"
}


dependency xvpc {
  config_path = "../svpc_network"
}

terraform {
  source = "../../../../modules/vpcsc_perimeter"
  
}


inputs = {
project_id=local.env_config.global.host_project.name
parent_id = local.env_config.vpcsc.parent_org_id
policy_id = dependency.vpcscpolicy.outputs.policy_id
host_network= dependency.xvpc.outputs.network_id
protected_project_ids = local.env_config.vpcsc.service_perimeters.perimeter1.protected_project_ids
protect_xvpc = local.env_config.vpcsc.service_perimeters.perimeter1.protect_xvpc
members = local.env_config.vpcsc.allowed_identities
restricted_services = local.env_config.vpcsc.service_perimeters.perimeter1.restricted_services
perimeter_name  = local.env_config.vpcsc.service_perimeters.perimeter1.perimeter_name
access_level_name  = dependency.vpcscpolicy.outputs.access_level_name
allowed_egress_projects = local.env_config.vpcsc.service_perimeters.perimeter1.allowed_egress_projects
allowed_ingress_projects = local.env_config.vpcsc.service_perimeters.perimeter1.allowed_ingress_projects
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
