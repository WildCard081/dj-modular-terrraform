resource "aws_vpc" "vpcs" {
  for_each = var.vpcs

  cidr_block = each.value["default"]
  enable_dns_hostnames = true

  tags = {
    Name = each.value["name"]
    Description = each.value["description"]
  }
}

data "aws_elb_service_account" "main" {}
