terraform {
    backend "s3" {}
}

provider "template" {}

provider "aws"{
  region                      = var.region
}

module "ansible" {
  source                      = "../../../terraform-modules/modules/ec2_ansible"

  prefix                      = var.prefix
  environment                 = var.environment
  region                      = var.region

  ansible_ami_id              = var.ansible_ami_id
  ansible_instance_type       = var.ansible_instance_type
  ansible_keypair_name        = var.ansible_keypair_name
  ansible_security_group_ids  = var.ansible_security_group_ids
  ansible_subnet_id           = var.ansible_subnet_id
}
