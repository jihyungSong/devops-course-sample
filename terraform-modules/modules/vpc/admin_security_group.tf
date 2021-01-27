resource "aws_security_group" "admin_access_sg" {
  name          =   "${local.tag_prefix}-admin-access-sg"
  vpc_id        =   aws_vpc.main.id

  # Outbound ALL
  egress {
    from_port   =   0
    to_port     =   0
    protocol    =   "-1"
    cidr_blocks =   ["0.0.0.0/0"]
  }

  tags = {
    Name        =   "${local.tag_prefix}-admin-access-sg"
    Managed_by  =   "terraform"
  }
}

resource "aws_security_group_rule" "admin_access_rule_ssh" {
  type                = "ingress"
  description         = "Allow SSH access from administrator"
  cidr_blocks         = [var.admin_cidr]
  from_port           = 22
  to_port             = 22
  protocol            = "tcp"
  security_group_id   = aws_security_group.admin_access_sg.id
}

resource "aws_security_group_rule" "access_rule_self" {
  type                      =   "ingress"
  description               =   "Allow Traffic by self"
  source_security_group_id  =   aws_security_group.admin_access_sg.id
  from_port                 =   0
  to_port                   =   65535
  protocol                  =   "all"
  security_group_id         =   aws_security_group.admin_access_sg.id
}
