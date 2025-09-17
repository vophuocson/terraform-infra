variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default = 8080
}


data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name = "vpc-id"
    values = [ data.aws_vpc.default.id ]
  }
}

data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = "son-vp-terraform-up-and-running-state"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "ap-southeast-1"
  }
}