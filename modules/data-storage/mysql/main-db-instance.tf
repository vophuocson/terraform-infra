resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine = var.engine_type
  allocated_storage =var.storage_size
  instance_class = var.instance_class
  skip_final_snapshot = var.skip_final_snapshot
  username = var.db_username
  password = var.db_password
}