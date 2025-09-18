resource "aws_autoscaling_group" "example" {
  min_size = var.min_size
  max_size = var.max_size
  launch_template {
    id = aws_launch_template.example.id
    version = "$Latest"
  }
  vpc_zone_identifier = data.aws_subnets.default.ids
  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"
  tag {
    key = "${var.cluster_name}"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

