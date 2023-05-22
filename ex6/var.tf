variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "USER" {
  default = "ubuntu"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-053b0d53c279acc90"
    us-east-2 = "ami-0430580de6244e02e"
  }
}

variable "PUB_KEY" {
  default = "/home/tran.nhat.minhb/.ssh/terraform.pub"
}

variable "PRIV_KEY" {
  default = "/home/tran.nhat.minhb/.ssh/terraform"
}
