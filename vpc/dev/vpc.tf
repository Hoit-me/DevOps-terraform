# VPC
# Whole network cidr will be 10.0.0.0/8 
# A VPC cidr will use the B class with 10.xxx.0.0/16
# You should set cidr advertently because if the number of VPC get larger then the ip range could be in shortage.
resource "aws_vpc" "default" {
  cidr_block           = "10.${var.cidr_numeral}.0.0/16" # Please set this according to your company size
  enable_dns_hostnames = true
  enable_dns_support   = true # DNS 리졸루션 활성화

  tags = {
    Name = "vpc-${var.vpc_name}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "igw-${var.vpc_name}"
  }
}



