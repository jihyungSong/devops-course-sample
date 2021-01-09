resource "aws_security_group" "eks_cluster_sg" {
  name          =   "${var.prefix}-${var.environment}-eks-cluster-sg"
  vpc_id        =   var.vpc_id

  # Outbound ALL
  egress {
    from_port   =   0
    to_port     =   0
    protocol    =   "-1"
    cidr_blocks =   ["0.0.0.0/0"]
  }

  tags = {
    Name        =   "${var.prefix}-${var.environment}-eks-cluster-sg"
    Managed_by  =   "terraform"
  }
}

resource "aws_security_group_rule" "cluster_access_rule_self" {
  type                = "ingress"
  description         = "Allow All traffic in cluster"
  self                = true
  from_port           = 0
  to_port             = 0
  protocol            = "-1"
  security_group_id   = aws_security_group.eks_cluster_sg.id
}
