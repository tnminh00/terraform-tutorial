resource "aws_key_pair" "terraform-key" {
  key_name   = "terraformkey"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "terraform-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  subnet_id              = aws_subnet.terra-pub-1.id
  key_name               = aws_key_pair.terraform-key.key_name
  vpc_security_group_ids = [aws_security_group.terra-stack-sg.id]
  tags = {
    Name    = "Terraform-instance"
    Project = "Terraform"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("/home/tran.nhat.minhb/.ssh/terraform")
    host        = self.public_ip
  }
}

resource "aws_ebs_volume" "terra-volume" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extr-terra-volume"
  }
}

resource "aws_volume_attachment" "attach_terra_vol" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.terra-volume.id
  instance_id = aws_instance.terraform-instance.id
}

output "PublicIP" {
  value = aws_instance.terraform-instance.public_ip
}
