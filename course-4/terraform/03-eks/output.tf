output "eks_cluster_endpoint" {
  value = module.eks.eks_ndpoint
}

output "kubectl_ec2_public_dns" {
  value = module.eks.kubectl_ec2_public_dns
}