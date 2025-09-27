data "tls_certificate" "github" {
  url = "https://token.actions.githubusercontent.com"
}

variable "allowed_repos_branches" {
  description = "GitHub repos/branches allowed to assume the IAM role."
  type = list(object({
    org = string
    repo = string
    branch = string
  }))
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect = "Allow"
    principals {
      identifiers = [aws_iam_openid_connect_provider.github_action.arn]
      type = "Federated"
    }
    condition {
      test = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values = [ 
        for a in var.allowed_repos_branches : "repo:${a["org"]}/${a["repo"]}:ref:refs/heads/${a["branch"]}"
      ]
    }
  }
}