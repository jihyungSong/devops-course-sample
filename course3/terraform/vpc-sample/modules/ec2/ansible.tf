resource "aws_iam_role" "ec2_read_only_role" {
  name                =   "${var.prefix}-${var.environment}-EC2ReadOnly"
  assume_role_policy  =   file("${path.module}/policy/ec2_assume_policy.json")

  tags = {
    Managed_by        =   "terraform"
  }
}

resource "aws_iam_role_policy" "ec2_read_only_policy" {
  name                =   "${var.prefix}-${var.environment}-EC2ReadOnlyPolicy"
  role                =   aws_iam_role.ec2_read_only_role.id
  policy              =   file("${path.module}/policy/ec2_read_only_policy.json")
}

resource "aws_iam_instance_profile" "ec2_read_only_profile" {
  name                =   "${var.prefix}-${var.environment}-EC2ReadOnly-Profile"
  role                =   aws_iam_role.ec2_read_only_role.name
}

data "template_file" "ansible_init" {
  template                =   file("${path.module}/template/ansible_install.tpl")

  vars = {
    region                =   var.region
    web_server_ssh_pem    =   file("${path.module}/ssh_pem/web_server.pem")
  }
}

resource "aws_instance" "ansible" {
  associate_public_ip_address   =   true
  ami                           =   var.ansible_ami_id
  subnet_id                     =   var.ansible_subnet_id
  instance_type                 =   var.ansible_instance_type
  key_name                      =   var.ansible_keypair_name
  vpc_security_group_ids        =   var.ansible_security_group_ids
  iam_instance_profile          =   aws_iam_instance_profile.ec2_read_only_profile.name
  user_data                     =   data.template_file.ansible_init.rendered

  tags = {
    Name        =   "${var.prefix}-${var.environment}-ansible"
    Managed_by  =   "terraform"
  }
}
