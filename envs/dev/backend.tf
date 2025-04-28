terraform {
  backend "gcs" {
    bucket      = "michaels-tf-state" # Replace with your GCS bucket name
    prefix      = "envs/dev"
    credentials = "bucket_sa.json" # git hub secret
  }
}
