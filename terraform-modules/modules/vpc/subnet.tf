resource "aws_subnet" "public_subnet" {
  count               =   length(var.public_subnets)

  vpc_id              =   aws_vpc.main.id
  cidr_block          =   lookup(var.public_subnets[count.index], "cidr_block")
  availability_zone   =   lookup(var.public_subnets[count.index], "availability_zone")

  tags = {
    Name              =   "${local.tag_prefix}-${lookup(var.public_subnets[count.index], "name")}"
    Managed_by        =   "terraform"
  }

  depends_on          =   [aws_vpc.main]
}

resource "aws_subnet" "private_subnet" {
  count               =   length(var.private_subnets)

  vpc_id              =   aws_vpc.main.id
  cidr_block          =   lookup(var.private_subnets[count.index], "cidr_block")
  availability_zone   =   lookup(var.private_subnets[count.index], "availability_zone")

  tags = {
    Name              =   "${local.tag_prefix}-${lookup(var.private_subnets[count.index], "name")}"
    Managed_by        =   "terraform"
  }

  depends_on          =   [aws_vpc.main]
}
