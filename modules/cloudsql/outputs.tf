output "instance_connection_name" {
  value = google_sql_database_instance.db_instance.connection_name
}
output "db_hodt" {
    value = google_sql_database_instance.db_instance.service_account_email_address
}
output "db_dns" {
  value = google_sql_database_instance.db_instance.dns_name

}