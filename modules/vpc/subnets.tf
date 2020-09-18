##########################
# Four subnets in two AZs
# Two Public, Two Private
##########################

resource "aws_subnet" "public" {
    count                   = 2
    vpc_id                  = aws_vpc.tusky.id
    cidr_block              = cidrsubnet(var.cidr_block, 2, count.index)
    availability_zone       = element(var.availability_zones, count.index)
    map_public_ip_on_launch = true

    tags = {
        "Name" = "public-subnet-${element(var.availability_zones, count.index)}"
    }
}

resource "aws_subnet" "private" {
    count                   = 2
    vpc_id                  = aws_vpc.tusky.id
    cidr_block              = cidrsubnet(var.cidr_block, 2, count.index + length(var.availability_zones))
    availability_zone       = element(var.availability_zones, count.index)
    map_public_ip_on_launch = false

    tags = {
        "Name" = "private-subnet-${element(var.availability_zones, count.index)}"
    }
}

# One NAT Gateway only
resource "aws_nat_gateway" "tusky" {
    count           = 1
    subnet_id       = element(aws_subnet.public.*.id, count.index)
    allocation_id   = element(aws_eip.tusky.*.id, count.index)

    tags = {
        "Name" = "NAT-${element(var.availability_zones, count.index)}"
    }
}

# One elastic IP address
resource "aws_eip" "tusky" {
    count   = 1
    vpc     = true
}