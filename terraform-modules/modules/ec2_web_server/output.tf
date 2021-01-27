output "web_server_ids" {
  value = aws_instance.web_server.*.id
}

output "web_access_sg_id" {
  value = aws_security_group.web_access_sg.id
}
