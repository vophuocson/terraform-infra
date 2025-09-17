resource "aws_autoscaling_group" "example" {
  min_size = 2
  max_size = 10
  launch_template {
    id = aws_launch_template.example.id
    version = "$Latest"
  }
  vpc_zone_identifier = data.aws_subnets.default.ids
  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"
  tag {
    key = "Name"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    key = "stage/services/webserver-cluster/terraform.tfstate"
    bucket = "son-vp-terraform-up-and-running-state"
    encrypt = true
    use_lockfile   = true 
    region = "ap-southeast-1"
  }
}