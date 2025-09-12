provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "instance_example" {
  ami = "ami-097f32b3a493c5a96"
  vpc_security_group_ids = [aws_security_group.instance.id]
  user_data  = <<-EOF
    #!/bin/bash
    mkdir -p /var/www
    echo "Hello, World" > /var/www/index.html
    nohup busybox httpd -f -p ${var.server_port} -h /var/www &
  EOF
  user_data_replace_on_change = true
  instance_type = "t3.micro"
  tags = {
    Name = "terraform-example"
  }
}