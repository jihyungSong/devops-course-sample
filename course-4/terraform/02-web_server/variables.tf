variable "environment" {}
variable "prefix" {}
variable "region" {}

variable "web_server_ami_id" {}
variable "web_server_instance_type" {}
variable "web_server_keypair_name" {}
variable "web_server_subnet_ids" {
  type = list(string)
}

variable "web_servers" {
  type = list(object({
    name                  =   string

    root_device       =   object({
      volume_type     =   string
      volume_size     =   number
    })

    data_devices      =   list(object({
      device_name     =   string
      volume_type     =   string
      volume_size     =   number
    }))
  }))
}

variable "vpc_id" {}
variable "alb_subnet_ids" {
    type    =   list(string)
}

variable "admin_security_group_id" {}
