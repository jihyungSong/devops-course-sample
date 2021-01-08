output "ecs_cluster_id" {
  value = aws_ecs_cluster.ecs_cluster.id
}

output "ecs_web_service_name" {
  value = aws_ecs_service.ecs_web_service.name
}

output "ecs_web_task_definition_id" {
  value = aws_ecs_task_definition.ecs_web_task.id
}

output "ecs_alb_arn" {
  value = aws_lb.ecs_alb.arn
}

output "ecs_alb_dns_name" {
  value = aws_lb.ecs_alb.dns_name
}
