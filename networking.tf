resource "aws_vpc" "production_vpc" {
  cidr_block                       = "172.31.0.0/16"
  instance_tenancy                 = "default"
  assign_generated_ipv6_cidr_block = false
  enable_dns_hostnames             = true

  tags = {
    Name = "production-vpc"
    Environment = "Production"
  }
}

resource "aws_subnet" "subnet_production" {
  vpc_id            = aws_vpc.production_vpc.id
  cidr_block        = "172.31.32.0/20"
  availability_zone = "us-east-1b"

  assign_ipv6_address_on_creation = false
  map_public_ip_on_launch         = true

  tags = {
    "Name"        = "production-172-31-32"
    "Environment" = "Production"
  }
}

