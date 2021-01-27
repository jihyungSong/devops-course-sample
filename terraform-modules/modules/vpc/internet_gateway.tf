resource "aws_internet_gateway" "igw" {
  vpc_id        =   aws_vpc.main.id

  tags = {
    Name        =   "${local.tag_prefix}-internet-gateway"
    Managed_by  =   "terraform"
  }
}
