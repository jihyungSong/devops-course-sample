resource "aws_instance" "kubectl" {
  associate_public_ip_address   =   true
  ami                           =   var.kubectl_ami_id
  subnet_id                     =   var.kubectl_subnet_id
  instance_type                 =   var.kubectl_instance_type
  key_name                      =   var.kubectl_keypair_name
  vpc_security_group_ids        =   [aws_security_group.eks_kubectl_sg.id]
  # iam_instance_profile          =   aws_iam_instance_profile.ec2_read_only_profile.name
  # user_data                     =   data.template_file.ansible_init.rendered

  tags = {
    Name        =   "${var.prefix}-${var.environment}-kubectl"
    Managed_by  =   "terraform"
  }
}
