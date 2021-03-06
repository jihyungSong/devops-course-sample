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

// Security Group
variable "admin_cidr" {}
