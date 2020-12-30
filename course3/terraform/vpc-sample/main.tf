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

  depends_on        = [module.vpc]
}

module "ec2" {
  source                      = "./modules/ec2"

  prefix                      = var.prefix
  environment                 = var.environment

  web_servers                 = var.web_servers
  subnet_ids                  = module.vpc.public_subnet_ids
  security_group_ids          = [module.security_group.web_access_sg_id]

  ansible_ami_id              = var.ansible_ami_id
  ansible_subnet_id           = module.vpc.public_subnet_ids[0]
  ansible_instance_type       = var.ansible_instance_type
  ansible_keypair_name        = var.ansible_keypair_name
  ansible_security_group_ids  = [module.security_group.admin_access_sg_id]

  depends_on                  = [module.vpc, module.security_group]
}
