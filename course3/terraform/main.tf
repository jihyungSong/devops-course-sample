terraform {
    backend "s3" {}
}

provider "template" {}

provider "aws"{
    region              = var.region
}

module "vpc" {
  source            = "./modules/vpc"

  environment       = var.environment
  prefix            = var.prefix

  vpc_cidr_block    = var.vpc_cidr_block
  public_subnets    = var.public_subnets
  private_subnets   = var.private_subnets
}

module "security_group" {
  source            = "./modules/security_group"

  environment       = var.environment
  prefix            = var.prefix

  vpc_id            = module.vpc.vpc_id
  admin_cidr        = var.admin_cidr

  depends_on = [module.vpc]
}

module "ec2" {
  source                = "./modules/ec2"

  prefix                = var.prefix
  environment           = var.environment

  servers               = var.servers
  subnet_ids            = module.vpc.public_subnet_ids
  security_group_ids    = [module.security_group.admin_access_sg_id, module.security_group.web_access_sg_id]

  depends_on            = [module.vpc, module.security_group]
}
