provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "tf_ubuntu_2004" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "terraform-key"
  vpc_security_group_ids = ["sg-06f0c752d797f8551"]
  tags = {
    Name    = "Terraform-instance"
    Project = "Terraform"
  }
}
