module "s3" {
  source = "../../../modules/bucket/s3"
  bucket_name = "stage-son-vp-terraform-up-and-running-state"
}