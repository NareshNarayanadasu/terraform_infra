project_id = "naresh-stage"
region     = "us-central1"
vpc_name   = "stage-vpc"

subnets = [
  {
    name   = "stage-subnet-a"
    cidr   = "10.30.0.0/24"
    region = "us-central1"
  },
  {
    name   = "stage-subnet-b"
    cidr   = "10.40.0.0/24"
    region = "us-east1"
  }
]
environment = "stage"

