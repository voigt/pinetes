resource "aws_default_vpc" "default" {}

output "default-vpc-id" {
  value = aws_default_vpc.default.id
}

data "aws_subnet_ids" "default_subnet" {
  vpc_id = aws_default_vpc.default.id
}

output "subnet_cidr_blocks" {
  value = data.aws_subnet_ids.default_subnet.ids
}
