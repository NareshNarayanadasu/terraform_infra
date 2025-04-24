project_id = "naresh-dev-456511"
region     = "us-central1"
vpc_name   = "dev-vpc"
zone = "us-central1-a"

subnets = [
  {
    name   = "dev-subnet-a"
    cidr   = "10.10.0.0/24"
    region = "us-central1"
  },
  {
    name   = "dev-subnet-b"
    cidr   = "10.20.0.0/24"
    region = "us-east1"
  }
]
environment = "dev"
db_password = "Naresh123"