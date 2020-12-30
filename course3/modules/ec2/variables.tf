variable "prefix" {}
variable "environment" {}

variable "servers" {
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
