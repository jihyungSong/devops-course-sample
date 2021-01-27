variable "prefix" {}
variable "environment" {}

variable "vpc_id" {}

variable "alb_subnet_ids" {
    type    =   list(string)
}

variable "web_server_ids" {
    type    =   list(string)
}