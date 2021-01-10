variable "prefix" {}
variable "environment" {}
variable "vpc_id" {}

variable "eks_cluster_version" {}
variable "eks_cluster_subnet_ids" {
  type = list(string)
}

variable "kubectl_ami_id" {}
variable "kubectl_subnet_id" {}
variable "kubectl_instance_type" {}
variable "kubectl_keypair_name" {}
variable "kubectl_admin_cidr_blocks" {
  type = list(string)
}
