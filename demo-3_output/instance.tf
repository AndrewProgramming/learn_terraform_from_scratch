resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}

output "ip" {
  value = aws_instance.example.public_ip
}

