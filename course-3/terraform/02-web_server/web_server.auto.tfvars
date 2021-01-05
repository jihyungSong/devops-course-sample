web_server_ami_id   =   "ami-0be2609ba883822ec"
web_server_instance_type = "t2.micro"
web_server_keypair_name = "fc-key"
web_server_subnet_ids = ["subnet-089b16097a1453bc9", "subnet-083e72b2df88cbd2b", "subnet-08cae3721579d033b",]
web_server_security_group_ids = ["sg-02f3759656da6e79b"]

web_servers = [
  {
    name            =   "webserver-01"
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
