resource "aws_eip" "ngw_eip" {
  vpc           =   true

  tags = {
    Name        =   "${local.tag_prefix}-nat-gateway-eip"
    Managed_by  =   "terraform"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id =   aws_eip.ngw_eip.id
  subnet_id     =   aws_subnet.public_subnet[0].id

  tags = {
    Name        =   "${local.tag_prefix}-nat-gateway"
    Managed_by  =   "terraform"
  }
}
