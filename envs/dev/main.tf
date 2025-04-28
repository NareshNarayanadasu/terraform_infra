provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = "dev_proj.json"
}
module "network" {
  source     = "../../modules/network"
  name       = var.vpc_name
  project_id = var.project_id
  subnets    = var.subnets
}


module "subnets" {
  source     = "../../modules/subnet"
  project_id = var.project_id
  network    = module.network.vpc_name
  subnets = [
    {
      name   = "frontend-subnet"
      cidr   = "10.10.10.0/24"
      region = var.region
    },
    {
      name   = "backend-subnet"
      cidr   = "10.10.20.0/24"
      region = var.region
    },
    {
      name   = "db-subnet"
      cidr   = "10.10.30.0/24"
      region = var.region
    }
  ]
}
module "gke" {
  source       = "../../modules/gke"
  project_id   = var.project_id
  region       = var.region
  zone = var.zone
  cluster_name = "gke-${var.environment}"
  network      = module.network.vpc_self_link
  subnetwork   = module.network.subnet_names[0]  # Use first subnet

  node_count   = 1
  machine_type = "e2-standard-2"
  node_labels  = {
    environment = var.environment
  }
}

module "gke_service_account" {
  source              = "../../modules/iam"
  project_id          = var.project_id
  service_account_id  = "gke-node-sa"
  display_name        = "GKE Node Service Account"
  roles               = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/container.nodeServiceAccount",
  ]
}
module "cloudsql" {
  source            = "../../modules/cloudsql"
  project_id        = var.project_id
  region            = var.region
  instance_name     = "dev-db"
  network           = module.network.vpc_self_link
  db_user           = "postgres"
  db_password      = var.db_password
}
