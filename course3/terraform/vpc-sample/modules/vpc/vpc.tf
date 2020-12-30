resource "aws_vpc" "main" {
  cidr_block    =   var.vpc_cidr_block

  tags = {
    Name        =   "${var.prefix}-${var.environment}-vpc"
    Managed_by  =   "terraform"
  }
}