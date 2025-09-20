provider "aws" {
  region = "ap-southeast-1"
}

module "mysql_db" {
  source = "../../../modules/data-storage/mysql"
  db_username = var.db_user_name
  db_password = var.db_password
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