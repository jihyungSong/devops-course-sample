terraform {
    backend "s3" {}
}

provider "template" {}

provider "aws"{
    region          =   var.region
}

module "ecs" {
  source            =   "../../../terraform-modules/modules/ecs"

  prefix            =   var.prefix
  environment       =   var.environment

  desired_count     =   var.desired_count
  ecs_task_cpu      =   var.ecs_task_cpu
  ecs_task_memory   =   var.ecs_task_memory

  ecs_web_service_subnet_ids          =   var.ecs_web_service_subnet_ids
  ecs_web_service_security_group_ids  =   var.ecs_web_service_security_group_ids

  nginx_container_image               =   var.nginx_container_image
  flask_container_image               =   var.flask_container_image

  ecs_alb_security_groups     = var.ecs_alb_security_groups
  ecs_alb_subnet_ids          = var.ecs_alb_subnet_ids
  vpc_id                      = var.vpc_id
}