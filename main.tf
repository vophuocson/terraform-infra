provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "instance_example" {
  ami = "ami-097f32b3a493c5a96"
  instance_type = "t3.micro"
  tags = {
    Name = "terraform-example"
  }
}