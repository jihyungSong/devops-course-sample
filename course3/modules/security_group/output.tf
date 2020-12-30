output "admin_access_sg_id" {
  value = aws_security_group.admin_access_sg.id
}

output "web_access_sg_id" {
  value = aws_security_group.web_access_sg.id
}
