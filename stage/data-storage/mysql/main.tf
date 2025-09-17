provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  skip_final_snapshot = true
  username = var.db_username
  password = var.db_password
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