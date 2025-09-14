terraform {
  backend "s3" {
    bucket = "son-vp-terraform-up-and-running-state"
    key = "global/s3/terraform.tfstate"
    region = "ap-southeast-1"
    encrypt = true
    use_lockfile   = true
  }
}