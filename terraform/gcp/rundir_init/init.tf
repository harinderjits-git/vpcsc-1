
locals {
  yaml_rg= yamldecode(file("${path.module}/../terragrunt/orchestration/config_env_sampleapp.yaml"))
}


module "project" {
  source = "../modules/projectmodule"
  labels = local.yaml_rg.global.labels
  parent          = local.yaml_rg.global.host_project.parent
  project_name    = local.yaml_rg.global.host_project.name
  project_id      = local.yaml_rg.global.host_project.id
  billing_account = local.yaml_rg.global.billing_account
  services        = local.yaml_rg.global.services
}

module "bucket" {
  source = "../modules/bucketmodule"
  labels = local.yaml_rg.global.labels
  project_id = local.yaml_rg.global.host_project.id
  location   =  local.yaml_rg.global.location
  bucketname = local.yaml_rg.global.remote_state.bucket_name
  depends_on = [
    module.project
  ]
}
