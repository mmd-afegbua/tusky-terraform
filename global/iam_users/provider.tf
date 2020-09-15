provider "aws" {
    region = var.region

    version = "~> 2.70"
}

terraform {
  backend "s3" {
    bucket = "tusky-remote"
    key    = "global/iam_roles/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "tusky"
    encrypt        = true
  }
}