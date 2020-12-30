output "web_server_ids" {
  value = aws_instance.web_server.*.id
}

output "ansible_server_id" {
  value = aws_instance.ansible.id
}