resource "aws_subnet" "public_subnet" {
  for_each = var.public_subnets
  vpc_id = aws_vpc.vpcs[each.value["vpc"]].id
  cidr_block = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags = {
    Name = format("%s", each.value["name"])
  }
}

resource "aws_subnet" "private_subnet" {
  for_each = var.private_subnets
  vpc_id = aws_vpc.vpcs[each.value["vpc"]].id
  cidr_block = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags = {
    Name = format("%s", each.value["name"])
  }
}