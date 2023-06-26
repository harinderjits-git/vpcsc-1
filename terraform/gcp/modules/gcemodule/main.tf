
data "google_compute_subnetwork" "my-subnetwork" {
  name    = var.subnetwork
  region  = var.region
  project = var.subnetwork_project
}

module "instance_template" {
  source                       = "terraform-google-modules/vm/google//modules/instance_template"
  region                       = var.region
  project_id                   = var.project_id
  stack_type                   = "IPV4_ONLY"
  labels                       = var.labels
  enable_nested_virtualization = false
  threads_per_core             = var.threads_per_core
  service_account              = null
  preemptible                  = true
  subnetwork                   = var.subnetwork
  subnetwork_project           = var.subnetwork_project
}


module "compute_instance" {
  source = "terraform-google-modules/vm/google//modules/compute_instance"
  region = var.region
  #zone                = var.zone
  subnetwork          = var.subnetwork
  subnetwork_project  = var.subnetwork_project
 # project_id          = var.project_id
  num_instances       = var.num_instances
  hostname            = var.hostname
  instance_template   = module.instance_template.self_link
  deletion_protection = false
  depends_on          = [module.instance_template]
  # access_config = [{
  #   nat_ip       = var.nat_ip
  #   network_tier = var.network_tier
  # }, ]
}
