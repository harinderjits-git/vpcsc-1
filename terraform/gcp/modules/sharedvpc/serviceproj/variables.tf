

variable "host_project" {
  description = "Billing account id."
  type        = string
  default     = null
}

variable "service_project" {
  description = "Billing account id."
  type        = string
  default     = null
}

variable "subnets" {
  type        =  list (object({
      name = string
      region = string
    }))
  
  default     = null
}


    # gke_proj:
    #   project_name: "service-623231-gke"
    #   subnets: 
    #   - gke-subnet02-use

# variable "project_id" {
#   description = "Billing account id."
#   type        = string
#   default     = null
# }

