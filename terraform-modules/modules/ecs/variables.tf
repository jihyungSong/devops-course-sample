variable "prefix" {}
variable "environment" {}
variable "vpc_id" {}

variable "ecs_task_cpu" {
  type = number
}
variable "ecs_task_memory" {
  type = number
}

variable "nginx_container_image" {}
variable "flask_container_image" {}

variable "ecs_web_service_subnet_ids" {
  type = list(string)
}
variable "ecs_web_service_security_group_ids" {
  type = list(string)
}
variable "desired_count" {
  type = number
}

variable "ecs_alb_security_groups" {
  type = list(string)
}

variable "ecs_alb_subnet_ids" {
  type = list(string)
}