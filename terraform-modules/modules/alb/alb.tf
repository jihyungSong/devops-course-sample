resource "aws_lb" "alb" {
  name                  =   "${local.tag_prefix}-alb"
  internal              =   false
  load_balancer_type    =   "application"
  security_groups       =   [aws_security_group.alb_sg.id]
  subnets               =   var.alb_subnet_ids

  tags = {
    Name                =   "${local.tag_prefix}-alb"
    Managed_by          =   "terraform"
  }
}

resource "aws_lb_target_group" "web_tg" {
  name                  =   "${local.tag_prefix}-tg"
  port                  =   80
  protocol              =   "HTTP"
  vpc_id                =   var.vpc_id
}

resource "aws_lb_listener" "web_front_end" {
  load_balancer_arn     =   aws_lb.alb.arn
  port                  =   "80"
  protocol              =   "HTTP"
  
  default_action {
    type                =   "forward"
    target_group_arn    =   aws_lb_target_group.web_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "web_server_tg_attach" {
  count                 =   length(var.web_server_ids)    
  
  target_group_arn      =   aws_lb_target_group.web_tg.arn
  target_id             =   var.web_server_ids[count.index]
  port                  =   80
}
