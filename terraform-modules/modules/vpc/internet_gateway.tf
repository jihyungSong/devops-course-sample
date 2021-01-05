resource "aws_internet_gateway" "igw" {
  vpc_id        =   aws_vpc.main.id

  tags = {
    Name        =   "${var.prefix}-${var.environment}-internet-gateway"
    Managed_by  =   "terraform"
  }
}
