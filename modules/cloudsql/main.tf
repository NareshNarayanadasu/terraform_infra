resource "google_sql_database_instance" "db_instance" {
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region
  project          = var.project_id

  settings {
    tier              = var.tier
    availability_type = "ZONAL"

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.network
    }

    backup_configuration {
      enabled = true
    }
  }

  deletion_protection = false
}

resource "google_sql_user" "default" {
  name     = var.db_user
  instance = google_sql_database_instance.db_instance.name
  password = var.db_password
}
