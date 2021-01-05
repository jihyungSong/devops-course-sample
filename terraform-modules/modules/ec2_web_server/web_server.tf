resource "aws_instance" "web_server" {
  count                         =   length(var.web_servers)

  associate_public_ip_address   =   true
  ami                           =   var.web_server_ami_id
  instance_type                 =   var.web_server_instance_type
  key_name                      =   var.web_server_keypair_name
  subnet_id                     =   var.web_server_subnet_ids[count.index]
  vpc_security_group_ids        =   var.web_server_security_group_ids
  user_data                     =   file("${path.module}/template/web_server.tpl")

  root_block_device {
    volume_type = lookup(var.web_servers[count.index].root_device, "volume_type")
    volume_size = lookup(var.web_servers[count.index].root_device, "volume_size")
  }

  dynamic "ebs_block_device" {
    for_each        = [for device in lookup(var.web_servers[count.index], "data_devices"): {
      device_name   = device.device_name
      volume_type   = device.volume_type
      volume_size   = device.volume_size
    }]
    content {
      device_name = ebs_block_device.value.device_name
      volume_type = ebs_block_device.value.volume_type
      volume_size = ebs_block_device.value.volume_size
    }
  }

  tags = {
    Name        =   "${var.prefix}-${var.environment}-${lookup(var.web_servers[count.index], "name")}"
    Managed_by  =   "terraform"
    server_type =   "web"
  }
}
