web_server_ami_id             =   ""
web_server_instance_type      =   "t2.micro"
web_server_keypair_name       =   ""
web_server_subnet_ids         =   []
admin_security_group_id       =   ""

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
