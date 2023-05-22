terraform {
  backend "s3" {
    bucket = "terraform-state-0507"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}
