output "vpc_id" {
    value = aws_vpc.tusky.id
}

output "public_subnets" {
    value = aws_subnet.public.*.id
}

output "public_cidr" {
    value = aws_subnet.public.*.cidr_block
}

output "private_subnets" {
    value = aws_subnet.private.*.id
}

output "private_cidr" {
    value = aws_subnet.private.*.cidr_block
}