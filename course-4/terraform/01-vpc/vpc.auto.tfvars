vpc_cidr_block        = "172.16.0.0/16"

public_subnets        = [
  {
    name              =   "public-subnet-1a"
    cidr_block        =   "172.16.1.0/24"
    availability_zone =   ""
  },
  {
    name              =   "public-subnet-2b"
    cidr_block        =   "172.16.2.0/24"
    availability_zone =   ""
  },
  {
    name              =   "public-subnet-3c"
    cidr_block        =   "172.16.3.0/24"
    availability_zone =   ""
  }
]

private_subnets       =   [
  {
    name              =   "private-subnet-4a"
    cidr_block        =   "172.16.11.0/24"
    availability_zone =   ""
  },
  {
    name              =   "private-subnet-5b"
    cidr_block        =   "172.16.12.0/24"
    availability_zone =   ""
  },
  {
    name              =   "private-subnet-6c"
    cidr_block        =   "172.16.13.0/24"
    availability_zone =   ""
  }
]

admin_cidr = "0.0.0.0/0"
