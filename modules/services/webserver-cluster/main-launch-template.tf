
resource "aws_launch_template" "example" {
  name_prefix   = "example-lt-"
  image_id      = "ami-097f32b3a493c5a96"
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = base64encode(templatefile("user-data.sh", {
    server_port = var.server_port
    db_address = data.terraform_remote_state.db.outputs.address
    db_port = data.terraform_remote_state.db.outputs.port
  }))
  
  lifecycle {
    create_before_destroy = true
  }
}