terraform {
  backend "gcs" {
    bucket  = "michaels-tf-state"
    prefix  = "envs/stage"
    credentials = "../../backend/sa.json"
  }
}
