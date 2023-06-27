

variable "labels" {
  description = "Resource labels."
  type        = map(string)
  default     = {}
}

# naming
variable "project_id" {
  type        = string
  description = "project_id"
}

variable "bucketname" {
  type        = string
  description = "name of the bucket"
}


variable "location" {
  type        = string
   description = "location of the bucket"
}

