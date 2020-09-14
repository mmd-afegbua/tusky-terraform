variable "region" {
    description = "Preferred region"
    type = string
}

variable "bucket" {
    description = "Bucket for backend"
    type = string
}

variable "dynamo" {
    description = "Dynamo db for remote state locks"
    type = string
}