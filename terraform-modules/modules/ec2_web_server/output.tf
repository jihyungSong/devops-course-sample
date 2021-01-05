output "web_server_ids" {
  value = aws_instance.web_server.*.id
}
