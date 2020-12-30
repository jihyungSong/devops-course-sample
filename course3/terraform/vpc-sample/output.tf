output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "admin_access_sg_id" {
  value = module.security_group.admin_access_sg_id
}

output "web_access_sg_id" {
  value = module.security_group.web_access_sg_id
}

output "ec2_instance_ids" {
  value = module.ec2.web_server_ids
}