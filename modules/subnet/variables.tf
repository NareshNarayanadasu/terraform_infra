variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "network" {
  description = "The VPC network self link"
  type        = string
}

variable "subnets" {
  description = "List of subnet definitions"
  type = list(object({
    name   = string
    cidr   = string
    region = string
  }))
}
