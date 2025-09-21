provider "aws" {
  region = "ap-southeast-1"
}
module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
  cluster_name = "stage"
  db_remote_state_bucket = "son-vp-stage-terraform-up-and-running-state"
  db_remote_state_key = "stage/services/webserver-cluster/terraform.tfstate"
  min_size = 1
  max_size = 2
  instance_type = "t3.micro"
  enable_autoscaling = false
}

# module "users" {
#   source = "../../../modules/landing-zone/iam-user"
#   user_names = var.user_names
# }

resource "aws_security_group_rule" "allow_testing_inbound" {
  type = "ingress"
  security_group_id = module.webserver_cluster.alb_security_group_id
  from_port = 12345
  to_port = 12345
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

terraform {
  backend "s3" {
    bucket = "stage-son-vp-terraform-up-and-running-state"
    key = "services/webserver-cluster/terraform.tfstate"
    encrypt = true
    use_lockfile   = true 
    region = "ap-southeast-1"
  }
}