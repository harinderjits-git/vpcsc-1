variable "project_id" {
  description = "proj id."
  type        = string
}

variable "parent_id" {
  description = "The parent of this AccessPolicy in the Cloud Resource Hierarchy. As of now, only organization are accepted as parent."
  type        = string
}

variable "policy_name" {
  description = "The policy's name."
  type        = string
}


variable "host_network" {
  type        = string

}
variable "protect_xvpc" {
  type        = bool
  default =true
}
variable "protected_project_ids" {
  description = "Project number of the project INSIDE the regular service perimeter."
  type        = list(string)
}

# variable "p_project_ids" {
#   description = "Project number of the project INSIDE the regular service perimeter."
#   type        = list(string)
# }
variable "ip_subnetworks" {
  description = "A list of CIDR block IP subnetwork specification. May be IPv4 or IPv6. Note that for a CIDR IP address block, the specified IP address portion must be properly truncated (i.e. all the host bits must be zero) or the input is considered malformed. For example, \"192.0.2.0/24\" is accepted but \"192.0.2.1/24\" is not. Similarly, for IPv6, \"2001:db8::/32\" is accepted whereas \"2001:db8::1/32\" is not. The originating IP of a request must be in one of the listed subnets in order for this Condition to be true. If empty, all IP addresses are allowed."
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