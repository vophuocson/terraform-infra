provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket = "son-vp-terraform-up-and-running-state"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "ap-southeast-1"
    encrypt = true
    use_lockfile = true
  }
}