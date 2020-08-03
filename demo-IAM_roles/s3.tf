resource "aws_s3_bucket" "b" {
  bucket = "mybucket-c29df12312"
  acl    = "private"

  tags = {
    Name = "mybucket-c29df12312"
  }
}

