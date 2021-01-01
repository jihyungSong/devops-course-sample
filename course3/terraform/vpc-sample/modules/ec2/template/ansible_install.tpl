#! /bin/bash
sudo yum update
sudo yum install -y python3
sudo pip3 install ansible
sudo pip3 install boto3
sudo mkdir -p /opt/ansible/inventory

sudo cat > /opt/ansible/inventory/aws_ec2.yaml << EOF
---
plugin: aws_ec2

regions:
  - ${region}

keyed_groups:
  - key: tags
    prefix: tag
EOF

sudo mkdir -p /etc/ansible
sudo cat > /etc/ansible/ansible.cfg << EOF
[defaults]
inventory      = /opt/ansible/inventory/aws_ec2.yaml

[inventory]
enable_plugins = aws_ec2
EOF

