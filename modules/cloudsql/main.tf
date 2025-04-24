resource "google_sql_database_instance" "db_instance" {
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region
  project          = var.project_id

  settings {
    tier = var.tier

    ip_configuration {
      ipv4_enabled    = true          # <-- Enable public IP
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
  password_wo = var.db_password
}
