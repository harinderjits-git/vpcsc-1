variable "project_id" {
  description = "proj id."
  type        = string
}

variable "parent_id" {
  description = "The parent of this AccessPolicy in the Cloud Resource Hierarchy. As of now, only organization are accepted as parent."
  type        = string
}

variable "policy_id" {
  description = "The policy's ID."
  type        = string
}


variable "host_network" {
  type        = string
  description = "shared VPC Network"
}
variable "protect_xvpc" {
  type        = bool
  default =true
}


variable "allowed_ingress_projects" {
  type        = list(string)
  default = []
}
variable "allowed_egress_projects" {
  type        = list(string)
  default = []
}
variable "protected_project_ids" {
  description = "Project IDs of the projects INSIDE the regular service perimeter."
  type        = list(string)
}


variable "members" {
  description = "An allowed list of members (users, service accounts). The signed-in identity originating the request must be a part of one of the provided members. If not specified, a request may come from any user (logged in/not logged in, etc.). Formats: user:{emailid}, serviceAccount:{emailid}"
  type        = list(string)
}


variable "regions" {
  description = "The request must originate from one of the provided countries/regions. Format: A valid ISO 3166-1 alpha-2 code."
  type        = list(string)
  default     = []
}


variable "restricted_services" {
  description = "The request must originate from one of the provided countries/regions. Format: A valid ISO 3166-1 alpha-2 code."
  type        = list(string)
  default     = []
}

variable "perimeter_name" {
  description = "Perimeter name of the Access Policy.."
  type        = string
  default     = "regular_perimeter_1"
}

variable "access_level_name" {
  description = "Access level name of the Access Policy."
  type        = string
  default     = "terraform_members"
}