variable "prefix" {}
variable "environment" {}

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