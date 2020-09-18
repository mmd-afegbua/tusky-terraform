#####################################
#Create VPC for entire infrastructure
#####################################

resource "aws_vpc" "tusky" {
    cidr_block = var.cidr_block

    tags = {
        "Name" = "poppy-carts-vpc"
    }
}

# Connect to the internet via IGW

resource "aws_internet_gateway" "tusky" {
    vpc_id = aws_vpc.tusky.id

    tags = {
        "Name" = "poppy-carts-igw"
    }
}