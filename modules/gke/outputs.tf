output "cluster_name" {
  value = google_container_cluster.gke.name
}

output "kube_config" {
  value = google_container_cluster.gke.endpoint
}
