terraform {
  backend "s3" {
    bucket = "terraform-state-0507"
    key    = "terraform/backend_ex6"
    region = "us-east-1"
  }
}
