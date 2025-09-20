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

variable "engine_type" {
  type = string
  description = "the engine runing db"
}

variable "storage_size" {
  type = number
  description = "size of storage db"
}

variable "instance_class" {
  type = string
  description = "the class  that instance using"
}

variable "skip_final_snapshot" {
  type = bool
  default = true
}