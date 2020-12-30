resource "aws_instance" "web_server" {
  count                         =   length(var.web_servers)

  associate_public_ip_address   =   true
  ami                           =   lookup(var.web_servers[count.index], "ami_id")
  subnet_id                     =   var.subnet_ids[count.index]
  instance_type                 =   lookup(var.web_servers[count.index], "instance_type")
  key_name                      =   lookup(var.web_servers[count.index], "keypair_name")
  vpc_security_group_ids        =   var.security_group_ids

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
  }
}
