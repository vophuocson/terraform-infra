output "alb_dns_name" {
  value = module.webserver_cluster.alb_dns_name
  description = "The domain name of the load balancer"
}


output "user_arns" {
  value = module.users[*].user_arn
  description = "The ARNs of the created IAM users"
}