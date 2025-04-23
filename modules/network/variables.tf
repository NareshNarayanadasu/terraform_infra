variable "name" {
  description = "Name of the VPC"
  type        = string
}

variable "project_id" {
  description = "Project ID to create VPC in"
  type        = string
}

variable "subnets" {
  type = list(object({
    name   = string
    cidr   = string
    region = string
  }))
  description = "List of subnet configurations"
}
