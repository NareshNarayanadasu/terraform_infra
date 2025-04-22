output "vpc_name" {
  value       = google_compute_network.vpc.name
  description = "Name of the created VPC"
}
