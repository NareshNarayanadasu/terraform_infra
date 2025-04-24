variable "project_id" {}
variable "region" {}
variable "vpc_name" {}
variable "zone" {
  
}

variable "subnets" {
  type = list(object({
    name   = string
    cidr   = string
    region = string
  }))
}
variable "environment" {}

variable "db_password" {
  type      = string
  sensitive = true
}