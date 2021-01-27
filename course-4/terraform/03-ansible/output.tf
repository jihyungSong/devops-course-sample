output "ec2_ansible_server_id" {
  value = module.ansible.ansible_server_id
}

output "ansible_server_public_ip" {
    value = module.ansible.ansible_server_public_ip
}

output "ansible_server_public_dns" {
    value = module.ansible.ansible_server_public_dns
}
