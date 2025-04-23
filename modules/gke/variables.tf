variable "project_id" {}
variable "region" {}
variable "cluster_name" {}
variable "network" {}
variable "subnetwork" {}
variable "zone" {
  
}
variable "node_count" {
  default = 1
}
variable "machine_type" {
  default = "e2-medium"
}
variable "node_labels" {
  type    = map(string)
  default = {}
}
