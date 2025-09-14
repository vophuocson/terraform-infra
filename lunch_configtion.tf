
resource "aws_launch_template" "example" {
  name_prefix   = "example-lt-"
  image_id      = "ami-097f32b3a493c5a96"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    mkdir -p /var/www
    echo "Hello, World" > /var/www/index.html
    nohup busybox httpd -f -p ${var.server_port} -h /var/www &
  EOF
  )
  
  lifecycle {
    create_before_destroy = true
  }
}