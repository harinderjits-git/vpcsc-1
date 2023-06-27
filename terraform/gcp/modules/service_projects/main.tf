
module "service_projects" {
  source          = "./projectmodule"
  for_each        = var.service_projects
  parent          = var.parent
  project_name    = each.value.project_name
  billing_account = var.billing_account
  project_id      = each.value.project_name
  services        = var.services
  labels          = var.labels
}
