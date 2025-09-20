output "db_port" {
  value = module.mysql_db.port
  description = "the port of db_instance"
}

output "address" {
  value = module.mysql_db.address
}