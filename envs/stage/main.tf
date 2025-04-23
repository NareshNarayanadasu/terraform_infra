provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = "stage-sa.json"
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
  cluster_name = "gke-${var.environment}"
  network      = module.network.vpc_self_link
  subnetwork   = module.network.subnet_names[0]  # Use first subnet

  node_count   = 2
  machine_type = "e2-standard-2"
  node_labels  = {
    environment = var.environment
  }
}
