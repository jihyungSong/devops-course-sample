resource "aws_instance" "ansible" {
  associate_public_ip_address   =   true
  ami                           =   var.ansible_ami_id
  subnet_id                     =   var.ansible_subnet_id
  instance_type                 =   var.ansible_instance_type
  key_name                      =   var.ansible_keypair_name
  vpc_security_group_ids        =   var.ansible_security_group_ids

  tags = {
    Name        =   "${var.prefix}-${var.environment}-ansible"
    Managed_by  =   "terraform"
  }
}