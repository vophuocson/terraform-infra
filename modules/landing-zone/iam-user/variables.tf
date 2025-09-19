# using count for variable
# variable "user_names" {
#   description = "Create IAM users with these names"
#   type = list(string)
#   default = ["neo", "trinity", "morpheus"]
# }
  
# using the count that to module
variable "user_name" {
  type = string
  description = "The user name to use"
}