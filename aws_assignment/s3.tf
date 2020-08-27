resource "aws_s3_bucket" "aws_assignment" {
  bucket = "my-tf-test-bucket-fagljlkjandrew"
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }
}