module "consul" {
  source = "./module/consul-cluster"
  key_name = aws_key_pair.mykey.key_name
  key_path = var.PATH_TO_PRIVATE_KEY
  region   = var.AWS_REGION
  vpc_id   = aws_default_vpc.default.id
  subnets = {
    "0" = aws_default_subnet.default_az1.id
    "1" = aws_default_subnet.default_az2.id
    "2" = aws_default_subnet.default_az3.id
  }
}

output "consul-output" {
  value = module.consul.server_address
}