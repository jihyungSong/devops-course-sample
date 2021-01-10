resource "aws_eks_fargate_profile" "eks_fargate" {
  cluster_name           = aws_eks_cluster.eks_cluster.name
  fargate_profile_name   = "${var.prefix}-${var.environment}-eks-fargate-profile"
  pod_execution_role_arn = aws_iam_role.eks_fargate_role.arn
  subnet_ids             = var.eks_cluster_subnet_ids

  selector {
    namespace = "${var.prefix}-${var.environment}"
  }

  tags = {
    Name                      =   "${var.prefix}-${var.environment}-eks-fargate-profile"
    Managed_by                =   "terraform"
  }
}
