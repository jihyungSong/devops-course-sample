resource "aws_codecommit_repository" "flask_application" {
  repository_name = "${var.prefix}-${var.environment}-flask"
  description     = "This is the Sample flask application"
}
