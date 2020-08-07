provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}
#HCL 
resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.micro"
}

