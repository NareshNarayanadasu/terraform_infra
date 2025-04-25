terraform {
   backend "gcs" {
     bucket  = "michaels-tf-state"   # Replace with your GCS bucket name
     prefix  = "envs/dev" 
     credentials = "${env.BUCKET_SA}"          # Separate prefix for each env
   }
 }
