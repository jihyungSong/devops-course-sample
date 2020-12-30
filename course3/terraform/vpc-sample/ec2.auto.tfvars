web_servers = [
  {
    name            =   "webserver-01"
    ami_id          =   "ami-0be2609ba883822ec"
    instance_type   =   "t2.micro"
    keypair_name    =   "jihyungsong-new-key"
    root_device     =   {
      volume_type   =   "gp3",
      volume_size   =   20
    }
    data_devices    =   [
      {
        device_name =   "/dev/sdb"
        volume_type =   "gp3",
        volume_size =   50
      }
    ]
  },
  {
    name            =   "webserver-02"
    ami_id          =   "ami-0be2609ba883822ec"
    instance_type   =   "t2.micro"
    keypair_name    =   "jihyungsong-new-key"
    root_device     =   {
      volume_type   =   "gp3",
      volume_size   =   20
    }
    data_devices    =   [
      {
        device_name =   "/dev/sdb"
        volume_type =   "gp3",
        volume_size =   50
      }
    ]
  },
  {
    name            =   "webserver-03"
    ami_id          =   "ami-0be2609ba883822ec"
    instance_type   =   "t2.micro"
    keypair_name    =   "jihyungsong-new-key"
    root_device     =   {
      volume_type   =   "gp3",
      volume_size   =   20
    }
    data_devices    =   [
      {
        device_name =   "/dev/sdb"
        volume_type =   "gp3",
        volume_size =   50
      }
    ]
  }
]

ansible_ami_id = "ami-0be2609ba883822ec"
ansible_instance_type = "t2.micro"
ansible_keypair_name = "jihyungsong-new-key"
