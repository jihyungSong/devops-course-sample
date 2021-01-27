output "ansible_server_id" {
    value = aws_instance.ansible.id
}

output "ansible_server_public_ip" {
    value = aws_instance.ansible.public_ip
}

output "ansible_server_public_dns" {
    value = aws_instance.ansible.public_dns
}

