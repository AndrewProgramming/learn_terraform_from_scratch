#use AWS s3 for remote state
terraform {
  backend "s3" {
    bucket = "terraform-remote-state-4"
    key    = "terraform/demo-2-remote-state"
    region = "ap-northeast-2"
  }
}