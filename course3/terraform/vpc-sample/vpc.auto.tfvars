vpc_cidr_block        = "172.16.0.0/16"

public_subnets        = [
  {
    name              =   "public-subnet-1a"
    cidr_block        =   "172.16.1.0/24"
    availability_zone =   "us-east-1a"
  },
  {
    name              =   "public-subnet-2b"
    cidr_block        =   "172.16.2.0/24"
    availability_zone =   "us-east-1b"
  },
  {
    name              =   "public-subnet-3c"
    cidr_block        =   "172.16.3.0/24"
    availability_zone =   "us-east-1c"
  }
]

private_subnets       =   [
  {
    name              =   "private-subnet-1d"
    cidr_block        =   "172.16.11.0/24"
    availability_zone =   "us-east-1d"
  },
  {
    name              =   "private-subnet-2e"
    cidr_block        =   "172.16.12.0/24"
    availability_zone =   "us-east-1e"
  },
  {
    name              =   "private-subnet-3f"
    cidr_block        =   "172.16.13.0/24"
    availability_zone =   "us-east-1f"
  }
]
