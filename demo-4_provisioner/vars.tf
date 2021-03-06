

variable "AWS_REGION" {
  default = "ap-northeast-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-northeast-2 = "ami-0d777f54156eae7d9"
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

