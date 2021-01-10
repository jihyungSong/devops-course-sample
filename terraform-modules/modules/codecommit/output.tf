output "repository_id" {
  value = aws_codecommit_repository.flask_application.repository_id
}

output "repository_clone_url" {
  value = aws_codecommit_repository.flask_application.clone_url_http
}
