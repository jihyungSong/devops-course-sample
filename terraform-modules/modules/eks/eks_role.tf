resource "aws_iam_role" "eks_role" {
  name                  =   "${var.prefix}-${var.environment}-EKSClusterRole"

  assume_role_policy    =   file("${path.module}/policy/eks_assume_policy.json")
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn            =   "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role                  =   aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "eks_vpc_resource_controller" {
  policy_arn            =   "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role                  =   aws_iam_role.eks_role.name
}
