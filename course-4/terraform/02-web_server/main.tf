terraform {}

provider "template" {}

provider "aws"{
  region                          = var.region
}

module "web_server" {
  source                                        = "../../../terraform-modules/modules/ec2_web_server"

  prefix                                        = var.prefix
  environment                                   = var.environment
  region                                        = var.region
  vpc_id                                        = var.vpc_id

  web_server_ami_id                             = var.web_server_ami_id
  web_server_instance_type                      = var.web_server_instance_type
  web_server_keypair_name                       = var.web_server_keypair_name

  web_server_admin_access_security_group_id     = var.admin_security_group_id
  web_server_subnet_ids                         = var.web_server_subnet_ids

  web_servers                                   = var.web_servers
}

module "alb" {  
  source                          = "../../../terraform-modules/modules/alb"

  prefix                          = var.prefix
  environment                     = var.environment

  vpc_id                          = var.vpc_id
  alb_subnet_ids                  = var.alb_subnet_ids
  web_server_ids                  = module.web_server.web_server_ids
}