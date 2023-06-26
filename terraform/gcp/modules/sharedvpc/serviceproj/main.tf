

# [START vpc_shared_vpc_service_project_attach]
resource "google_compute_shared_vpc_service_project" "serviceproj" {
  host_project    = var.host_project
  service_project = var.service_project
}
# [END vpc_shared_vpc_service_project_attach]

data google_project service {
  project_id = var.service_project
}

resource "google_compute_subnetwork_iam_binding" "binding" {
 for_each = tomap({
    for t in var.subnets :
    "${t.name}:${t.region}" => t
  })
  project = var.host_project
  region = each.value.region
  subnetwork = each.value.name
  role = "roles/compute.networkUser"
  members = [
        "serviceAccount:${data.google_project.service.number}-compute@developer.gserviceaccount.com",
        "serviceAccount:${data.google_project.service.number}@cloudservices.gserviceaccount.com",
  ]
}