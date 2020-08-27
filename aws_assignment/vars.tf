variable "AWS_REGION" {
  default = "ap-southeast-1"
}

variable "INSTANCE_TYPE" {
  default =  "t2.micro"
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

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-southeast-1 = "ami-04dfc6348dc03c931"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}



