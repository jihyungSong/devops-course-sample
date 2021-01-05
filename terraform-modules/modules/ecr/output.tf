output "nginx_ecr_repo_url" {
  value = aws_ecr_repository.nginx_ecr_repo.repository_url
}

output "flask_ecr_repo_url" {
  value = aws_ecr_repository.flask_ecr_repo.repository_url
}
