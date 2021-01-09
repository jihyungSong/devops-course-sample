variable "environment" {}
variable "prefix" {}
variable "region" {}
variable "vpc_id" {}

variable "eks_cluster_version" {}
variable "eks_cluster_subnet_ids" {
  type = list(string)
}
