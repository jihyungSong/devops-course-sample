resource "aws_iam_role" "ecs_task_execution_role" {
  name                =   "${var.prefix}-${var.environment}-ECSTaskExecutionRole"
  assume_role_policy  =   file("${path.module}/policy/ecs_task_assume_policy.json")

  tags = {
    Managed_by        =   "terraform"
  }
}

resource "aws_iam_role_policy" "ecs_task_execution_policy" {
  name                =   "${var.prefix}-${var.environment}-ECSTaskExecutionRolePolicy"
  role                =   aws_iam_role.ecs_task_execution_role.id
  policy              =   file("${path.module}/policy/ecs_task_execution_role_policy.json")
}

resource "aws_iam_instance_profile" "ecs_task_profile" {
  name                =   "${var.prefix}-${var.environment}-ECSTask-Profile"
  role                =   aws_iam_role.ecs_task_execution_role.name
}

data "template_file" "ecs_task_definition_json" {
  template                      =   file("${path.module}/template/web-task.json")

  vars = {
    ecs_task_nginx_name         =   "nginx"
    ecs_task_nginx_image        =   var.nginx_container_image
    ecs_task_flask_name         =   "flask"
    ecs_task_flask_image        =   var.flask_container_image
  }
}

resource "aws_ecs_task_definition" "ecs_web_task" {
  family                =   "${var.prefix}-${var.environment}-web-task"
  network_mode          =   "awsvpc"
  execution_role_arn    =   aws_iam_role.ecs_task_execution_role.arn
  cpu                   =   var.ecs_task_cpu
  memory                =   var.ecs_task_memory
  container_definitions =   data.template_file.ecs_task_definition_json.rendered

  tags = {
    Managed_by        =   "terraform"
  }
}
