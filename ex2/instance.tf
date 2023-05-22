resource "aws_instance" "terraform-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "terraform-key"
  vpc_security_group_ids = ["sg-06f0c752d797f8551"]
  tags = {
    Name    = "Terraform-instance"
    Project = "Terraform"
  }
}
