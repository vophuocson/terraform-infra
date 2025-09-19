provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_iam_user" "example" {
  # using count for variable
  # count = length(var.user_names)
  # name = var.user_names[count.index]

  # using the count that to module
  name = var.user_name
}
