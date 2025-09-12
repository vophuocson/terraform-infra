output "public_ip" {
  value = aws_instance.instance_example.public_ip
  description = "The public IP address of the web server"
  depends_on = [ aws_security_group.instance ]
}