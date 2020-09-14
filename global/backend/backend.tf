terraform {
    backend "s3" {
        bucket = "tusky-remote"
        key = "global/backend/terraform.tfstate"
        region = "us-east-1"

        dynamodb_table = "tusky"
        encrypt = true
    }
}
