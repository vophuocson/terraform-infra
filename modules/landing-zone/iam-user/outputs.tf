# using count for variable
# output "all_arns" {
#   value = aws_iam_user.example[*].arn
#   description = "The ARNs for all users"
# }

# using the count that to module
output "user_arn" {
  value = aws_iam_user.example.arn
  description = "The ARN of the created IAM user"
}