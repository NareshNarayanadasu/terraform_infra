output "subnet_names" {
  value       = [for s in google_compute_subnetwork.subnet : s.name]
  description = "List of created subnets"
}
