terraform {
    backend "s3" {}
}

provider "template" {}

provider "aws"{
    region          =   var.region
}

module "eks" {
  source                          =   "../../../terraform-modules/modules/eks"

  prefix                          =   var.prefix
  environment                     =   var.environment
  vpc_id                          =   var.vpc_id

  eks_cluster_version             =   var.eks_cluster_version
  eks_cluster_subnet_ids          =   var.eks_cluster_subnet_ids

  kubectl_ami_id                  =   var.kubectl_ami_id
  kubectl_instance_type           =   var.kubectl_instance_type
  kubectl_keypair_name            =   var.kubectl_keypair_name
  kubectl_subnet_id               =   var.kubectl_subnet_id
  kubectl_admin_cidr_blocks       =   var.kubectl_admin_cidr_blocks
}