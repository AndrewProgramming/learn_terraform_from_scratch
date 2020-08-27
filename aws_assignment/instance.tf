resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.INSTANCE_TYPE

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.myinstance.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # user data
  user_data = data.template_cloudinit_config.cloudinit-example.rendered

  provisioner "file" {
    source      = "html_content.html"
    destination = "/tmp/html_content.html"
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/script.sh",
  #     "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
  #     "sudo /tmp/script.sh",
  #   ]
  # }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }

  tags = {
    Name = "aws-assignment-1"
  }
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "ap-southeast-1a"
  size              = 1
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.example.id
  skip_destroy = true                            # skip destroy to avoid issues with terraform destroy
}


resource "aws_eip" "lb" {
  instance = aws_instance.example.id
  vpc      = true
}