provider "aws" {
  region = "ap-southeast-1"
}

module "mysql_db" {
  source = "../../../modules/data-storage/mysql"
  db_username = var.db_username
  db_password = var.db_password
  engine_type = "mysql"
  storage_size = 10
  instance_class = "db.t3.micro"
  skip_final_snapshot = true
}


terraform {
  backend "s3" {
    bucket = "stage-son-vp-terraform-up-and-running-state"
    key = "data-stores/mysql/terraform.tfstate"
    region = "ap-southeast-1"
    encrypt = true
    use_lockfile = true
  }
}
