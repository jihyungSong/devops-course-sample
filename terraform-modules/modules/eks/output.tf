output "eks_ndpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "eks_fargate_profile_id" {
  value = aws_eks_fargate_profile.eks_fargate.id
}

output "kubectl_ec2_public_dns" {
  value = aws_instance.kubectl.public_dns
}