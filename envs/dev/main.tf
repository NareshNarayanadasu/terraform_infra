provider "google" {
  project = var.project_id
  region  = var.region
  credentials = "dev-sa.json"
}

module "network" {
  source     = "../../modules/network"
  name       = var.vpc_name
  project_id = var.project_id
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