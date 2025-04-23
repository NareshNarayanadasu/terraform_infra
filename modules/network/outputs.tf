output "vpc_name" {
  value       = google_compute_network.vpc.name
  description = "Name of the created VPC"
}

output "vpc_self_link" {
  value = google_compute_network.vpc.self_link
}

output "subnet_names" {
  value = [for s in google_compute_subnetwork.subnets : s.name]
}
