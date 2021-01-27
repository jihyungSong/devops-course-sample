output "alb_id" {
    value   =   aws_lb.alb.id
}

output "alb_arn" {
    value   =   aws_lb.alb.arn
}

output "alb_dns_name" {
    value   =   aws_lb.alb.dns_name
}

output "target_group_id" {
    value   =   aws_lb_target_group.web_tg.id
}

output "target_group_arn" {
    value   =   aws_lb_target_group.web_tg.arn
}

output "listener_id" {
    value   =   aws_lb_listener.web_front_end.id
}

output "listener_arn" {
    value   =   aws_lb_listener.web_front_end.arn
}

output "alb_security_group_id" {
    value   =   aws_security_group.alb_sg.id
}