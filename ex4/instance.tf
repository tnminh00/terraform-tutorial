resource "aws_key_pair" "terraform-key" {
  key_name   = "terraformkey"
  public_key = file("/home/tran.nhat.minhb/.ssh/terraform.pub")
}

resource "aws_instance" "terraform-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.terraform-key.key_name
  vpc_security_group_ids = ["sg-06f0c752d797f8551"]
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

output "PublicIP" {
  value = aws_instance.terraform-instance.public_ip
}

output "PrivateIP" {
  value = aws_instance.terraform-instance.private_ip
}
