
# [START vpc_shared_vpc_host_project_enable]
resource "google_compute_shared_vpc_host_project" "host" {
  project = var.host_project # Replace this with your host project ID in quotes
}
# [END vpc_shared_vpc_host_project_enable]


module "serviceproj" {
  for_each = var.service_projects
  source = "./serviceproj"
  host_project = var.host_project
  service_project = each.value.project_name
  subnets = each.value.subnets

}