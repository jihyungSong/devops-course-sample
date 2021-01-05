terraform {
    backend "s3" {}
}

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
}

module "security_group" {
  source            = "../../../terraform-modules/modules/security_group"

  environment       = var.environment
  prefix            = var.prefix

  vpc_id            = module.vpc.vpc_id
  admin_cidr        = var.admin_cidr

  depends_on        = [module.vpc]
}
