output "ec2_instance_ids" {
    value   =   module.web_server.web_server_ids
}

output "alb_arn" {
    value   =   module.alb.alb_arn
}

output "alb_dns_name" {
    value   =   module.alb.alb_dns_name
}
