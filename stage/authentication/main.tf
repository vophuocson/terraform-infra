module "authenticate" {
  source = "../../modules/authentication"
  allowed_repos_branches = [
    {
      org    = "vophuocson"
      repo   = "terraform-infra"
      branch = "main"
    },
  ]
}

terraform {
  backend "s3" {
    bucket       = "stage-son-vp-terraform-up-and-running-state"
    key          = "authentication/terraform.tfstate"
    encrypt      = true
    use_lockfile = true
    region       = "ap-southeast-1"
  }
}
