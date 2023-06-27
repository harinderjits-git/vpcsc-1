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

