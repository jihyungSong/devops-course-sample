variable "prefix" {}
variable "environment" {}
variable "vpc_id" {}

variable "eks_cluster_version" {}
variable "eks_cluster_subnet_ids" {
  type = list(string)
}
