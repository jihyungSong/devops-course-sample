terraform {
    backend "s3" {}
}

provider "template" {}

provider "aws"{
  region                      = var.region
}

module "web_server" {
  source                          = "../../../terraform-modules/modules/ec2_web_server"

  prefix                          = var.prefix
  environment                     = var.environment
  region                          = var.region

  web_server_ami_id               = var.web_server_ami_id
  web_server_instance_type        = var.web_server_instance_type
  web_server_keypair_name         = var.web_server_keypair_name

  web_server_security_group_ids   = var.web_server_security_group_ids
  web_server_subnet_ids           = var.web_server_subnet_ids

  web_servers                     = var.web_servers
}
