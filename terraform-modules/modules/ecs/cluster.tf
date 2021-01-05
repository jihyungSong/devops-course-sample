resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.prefix}-${var.environment}-ecs-cluster"

  tags = {
    Name        =   "${var.prefix}-${var.environment}-ecs-cluster"
    Managed_by  =   "terraform"
  }
}
