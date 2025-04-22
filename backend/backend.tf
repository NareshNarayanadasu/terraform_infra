terraform {
   backend "gcs" {
     bucket  = "michaels-tf-state-for-dev-9677"   # Replace with your GCS bucket name
     prefix  = "envs/dev"            # Separate prefix for each env
   }
 }
