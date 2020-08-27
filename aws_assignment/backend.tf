#use AWS s3 for remote state
terraform {
  backend "s3" {
    bucket = "terraform-remote-state-aws-assignment"
    key    = "terraform/demo-remote-state"
    region = "ap-southeast-1"
  }
}