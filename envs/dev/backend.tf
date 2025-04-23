terraform {
  backend "gcs" {
    bucket      = "michaels-tf-state" # Replace with your GCS bucket name
    prefix      = "envs/dev"
    credentials = "../../backend/sa.json" # Separate prefix for each env
  }
}
