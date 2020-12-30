variable "environment" {}
variable "prefix" {}
variable "region" {}

// VPC
variable "vpc_cidr_block" {}

// Subnet
variable "public_subnets" {
    description           =   "Public Subnets info in VPC"
    type = list(object({
      name                =   string
      cidr_block          =   string
      availability_zone   =   string
    }))
}

variable "private_subnets" {
    description           =   "Private Subnets info in VPC"
    type = list(object({
      name                =   string
      cidr_block          =   string
      availability_zone   =   string
    }))
}

variable "admin_cidr" {}

variable "web_servers" {
  type = list(object({
    name                  =   string
    ami_id                =   string
    instance_type         =   string
    keypair_name          =   string

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

variable "ansible_ami_id" {}
variable "ansible_instance_type" {}
variable "ansible_keypair_name" {}
