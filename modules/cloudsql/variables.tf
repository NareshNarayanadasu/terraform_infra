variable "project_id" {}
variable "region" {}
variable "instance_name" {}
variable "database_version" {
  default = "POSTGRES_13"
}
variable "tier" {
  default = "db-f1-micro"
}
variable "network" {}
variable "db_user" {}
variable "db_password" {
  sensitive = true
}
