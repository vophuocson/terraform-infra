provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_iam_openid_connect_provider" "github_action" {
  url = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.github.certificates[0].sha1_fingerprint]
}

resource "aws_iam_role" "auth_role" {
  name = "AuthenticationRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}