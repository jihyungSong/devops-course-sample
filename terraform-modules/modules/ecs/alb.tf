resource "aws_lb" "ecs_alb" {
  name                = "${var.prefix}-${var.environment}-ecs-alb"
  internal            = false
  load_balancer_type  = "application"
  security_groups     = var.ecs_alb_security_groups
  subnets             = var.ecs_alb_subnet_ids

  tags = {
    Name              =   "${var.prefix}-${var.environment}-ecs-alb"
    Managed_by        =   "terraform"
  }
}

resource "aws_lb_target_group" "ecs_alb_tg" {
  name                =   "${var.prefix}-${var.environment}-ecs-tg"
  port                =   80
  protocol            =   "HTTP"
  target_type         =   "ip"
  vpc_id              =   var.vpc_id

  tags = {
    Name              =   "${var.prefix}-${var.environment}-ecs-tg"
    Managed_by        =   "terraform"
  }
}

resource "aws_lb_listener" "ecs_alb_listener" {
  load_balancer_arn   = aws_lb.ecs_alb.arn
  port                = "80"
  protocol            = "HTTP"

  default_action {
    type              = "forward"
    target_group_arn  = aws_lb_target_group.ecs_alb_tg.arn
  }

  depends_on          = [aws_lb.ecs_alb, aws_lb_target_group.ecs_alb_tg]
}