variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "service_account_id" {
  description = "The ID of the service account (name)"
  type        = string
}

variable "display_name" {
  description = "Human-readable display name"
  type        = string
}

variable "roles" {
  description = "List of roles to assign to the service account"
  type        = list(string)
}
