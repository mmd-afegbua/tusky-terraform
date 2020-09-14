/*
terraform {
    backend "s3" {
        bucket = "tusky"
        key = "global/backend/terraform.tfstate"
        region = "us-east-1"

        dynamodb_table = "poppy-carts-locks"
        encrypt = true
    }
}
*/