variable "project_id" {}
variable "region" {}
variable "vpc_name" {}

variable "subnets" {
  type = list(object({
    name   = string
    cidr   = string
    region = string
  }))
}
variable "environment" {}
