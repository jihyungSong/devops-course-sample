variable "environment" {}
variable "prefix" {}
variable "region" {}

variable "ansible_ami_id" {}
variable "ansible_instance_type" {}
variable "ansible_keypair_name" {}

variable "ansible_security_group_ids" {
  type = list(string)
}

variable "ansible_subnet_id" {}
