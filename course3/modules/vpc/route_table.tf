// Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id        =   aws_vpc.main.id

  tags = {
    Name        =   "${var.prefix}-${var.environment}-public-rt"
    Managed_by  =   "terraform"
  }
}

resource "aws_route" "public_route_table_external" {
  route_table_id            = aws_route_table.public_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id

  depends_on                = [aws_route_table.public_route_table, aws_internet_gateway.igw]
}

resource "aws_route_table_association" "public_route_table_assoc" {
  subnet_id                 = lookup(aws_subnet.public_subnet[count.index], "id")
  route_table_id            = aws_route_table.public_route_table.id
  count                     = length(aws_subnet.public_subnet)

  depends_on                = [aws_route_table.public_route_table]
}


// Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id        =   aws_vpc.main.id

  tags = {
    Name        =   "${var.prefix}-${var.environment}-private-rt"
    Managed_by  =   "terraform"
  }
}

resource "aws_route" "private_route_table_nat" {
  route_table_id            = aws_route_table.private_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.ngw.id

  depends_on                = [aws_route_table.private_route_table, aws_nat_gateway.ngw]
}

resource "aws_route_table_association" "private_route_table_assoc" {
  subnet_id                 = lookup(aws_subnet.private_subnet[count.index], "id")
  route_table_id            = aws_route_table.private_route_table.id
  count                     = length(aws_subnet.private_subnet)

  depends_on                = [aws_route_table.private_route_table]
}