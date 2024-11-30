terraform {
  backend "s3" {
    bucket = "backend-terraform-shogun-dynamo"
    key = "database/terraform.tfstate"
    region = "us-east-1"
  }
}