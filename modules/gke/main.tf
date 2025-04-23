resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.zone
  project  = var.project_id

  networking_mode  = "VPC_NATIVE"
  remove_default_node_pool = true
  deletion_protection = false
  initial_node_count       = 1
  network                  = var.network
  subnetwork               = var.subnetwork
  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {}
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.gke.name
  project    = var.project_id

  node_config {
    machine_type = var.machine_type
    disk_type = "pd-standard"
    disk_size_gb = 60
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    labels = var.node_labels
  }

  initial_node_count = var.node_count
  autoscaling {
    min_node_count = 1
    max_node_count = 1
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
