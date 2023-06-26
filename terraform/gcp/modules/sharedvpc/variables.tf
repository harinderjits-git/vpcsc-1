variable "host_project" {
  description = "Billing account id."
  type        = string
  default     = null
}


variable "service_projects" {
  type        = map(object ({
    project_name = string
    subnets = list (object({
      name = string
      region = string
    }))
  }))
  default     = null
}


# service_projects:
#     gke_proj:
#       project_name: "service-623231-gke"
#       subnets: 
#       - name: gke-subnet02-use
#         region: "us-central1"
#       - name: gke-subnet02-use
#         region: "us-central1" 


