terraform {}

provider "template" {}

provider "aws"{
  region            = var.region
}

module "vpc" {
  source            = "../../../terraform-modules/modules/vpc"

  environment       = var.environment
  prefix            = var.prefix

  vpc_cidr_block    = var.vpc_cidr_block
  public_subnets    = var.public_subnets
  private_subnets   = var.private_subnets
  
  admin_cidr        = var.admin_cidr
}
