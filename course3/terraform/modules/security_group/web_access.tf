# SG for MongoDB Bastion Access
resource "aws_security_group" "web_access_sg" {
  name          =   "${var.prefix}-${var.environment}-web-access-sg"
  vpc_id        =   var.vpc_id

  # Outbound ALL
  egress {
    from_port   =   0
    to_port     =   0
    protocol    =   "-1"
    cidr_blocks =   ["0.0.0.0/0"]
  }

  tags = {
    Name        =   "${var.prefix}-${var.environment}-web-access-sg"
    Managed_by  =   "terraform"
  }
}

resource "aws_security_group_rule" "web_access_rule_http" {
  type                = "ingress"
  description         = "Allow access HTTP"
  cidr_blocks         = ["0.0.0.0/0"]
  from_port           = 80
  to_port             = 80
  protocol            = "tcp"
  security_group_id   = aws_security_group.web_access_sg.id
}
