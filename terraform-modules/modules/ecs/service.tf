resource "aws_iam_role" "ecs_service_role" {
  name                =   "${var.prefix}-${var.environment}-ECSServiceRole"
  assume_role_policy  =   file("${path.module}/policy/ecs_assume_policy.json")

  tags = {
    Managed_by        =   "terraform"
  }
}

resource "aws_iam_role_policy" "ecs_service_policy" {
  name                =   "${var.prefix}-${var.environment}-ECSServiceRolePolicy"
  role                =   aws_iam_role.ecs_service_role.id
  policy              =   file("${path.module}/policy/ecs_service_role_policy.json")
}

resource "aws_iam_instance_profile" "ecs_service_profile" {
  name                =   "${var.prefix}-${var.environment}-ECSService-Profile"
  role                =   aws_iam_role.ecs_service_role.name
}

resource "aws_ecs_service" "ecs_web_service" {
  name            = "${var.prefix}-${var.environment}-web-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_web_task.arn
  launch_type     = "FARGATE"
  desired_count   = var.desired_count
  # iam_role        = aws_iam_role.ecs_service_role.arn

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_alb_tg.arn
    container_name   = "nginx"
    container_port   = 80
  }

  network_configuration {
    subnets           = var.ecs_web_service_subnet_ids
    security_groups   = var.ecs_web_service_security_group_ids
    assign_public_ip  = false
  }

  depends_on       = [aws_iam_role.ecs_service_role, aws_ecs_task_definition.ecs_web_task, aws_ecs_cluster.ecs_cluster, aws_lb_listener.ecs_alb_listener]
}