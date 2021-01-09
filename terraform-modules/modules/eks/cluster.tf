resource "aws_eks_cluster" "eks_cluster" {
  name                        = "${var.prefix}-${var.environment}-ecs-cluster"
  version                     = var.eks_cluster_version
  role_arn                    = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids                =   var.eks_cluster_subnet_ids
    security_group_ids        =   [aws_security_group.eks_cluster_sg.id]
    endpoint_public_access    =   true
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_vpc_resource_controller,
  ]

  tags = {
    Name                      =   "${var.prefix}-${var.environment}-eks-cluster"
    Managed_by                =   "terraform"
  }
}
