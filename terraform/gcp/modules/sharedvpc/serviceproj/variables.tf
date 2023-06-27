

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
    description = "subnet configuration"
  type        =  list (object({
      name = string
      region = string
    }))
  
  default     = null
}
