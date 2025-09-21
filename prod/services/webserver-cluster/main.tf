provider "aws" {
  region = "ap-southeast-1"
}
module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
  cluster_name = "prod"
  db_remote_state_bucket = "prod-terraform-up-and-running-state"
  db_remote_state_key = "prod/services/webserver-cluster/terraform.tfstate"
  min_size = 1
  max_size = 2
  instance_type = "t3.micro"
  enable_autoscaling = true
}

terraform {
  backend "s3" {
    bucket = "prod-terraform-up-and-running-state"
    key = "prod/services/webserver-cluster/terraform.tfstate"
    encrypt = true
    use_lockfile   = true 
    region = "ap-southeast-1"
  }
}