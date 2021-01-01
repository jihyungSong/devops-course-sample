variable "prefix" {}
variable "environment" {}
variable "region" {}

variable "web_servers" {
  type = list(object({
    name              =   string
    ami_id            =   string
    instance_type     =   string
    keypair_name      =   string

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

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "ansible_ami_id" {}
variable "ansible_instance_type" {}
variable "ansible_keypair_name" {}
variable "ansible_subnet_id" {}
variable "ansible_security_group_ids" {
  type = list(string)
}