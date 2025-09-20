variable "db_username" {
  description = "The username for the database"
  sensitive = true
  type = string
}

variable "db_password" {
  type = string
  sensitive = true
  description = "The password for the database"
}

