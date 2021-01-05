resource "aws_ecr_repository" "nginx_ecr_repo" {
  name                 = "${var.prefix}-${var.environment}-nginx"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "flask_ecr_repo" {
  name                 = "${var.prefix}-${var.environment}-nginx"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
