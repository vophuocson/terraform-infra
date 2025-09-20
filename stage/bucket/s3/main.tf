# terraform {
#   backend "s3" {
#     key = "global/s3/terraform.tfstate"
#     bucket = "stage-son-vp-terraform-up-and-running-state"
#     encrypt = true
#     use_lockfile   = true 
#     region = "ap-southeast-1"
#   }
# }


module "s3" {
  source = "../../../modules/bucket/s3"
  bucket_name = "stage-son-vp-terraform-up-and-running-state"
}