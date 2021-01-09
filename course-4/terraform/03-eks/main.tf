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
}