

# DB PRIVATE SUBNETS
# This subnet is only for the database. 
# For security, it is better to assign ip range for database only. This subnet will not use NAT Gateway
# This is also going to use /20 cidr, which might be too many IPs... Please count it carefully and change the cidr.
resource "aws_subnet" "private_db" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.default.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_private_db[count.index]}.0/20"
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name    = "db-private-${count.index}-${var.vpc_name}"
    Network = "Private"
  }
}

# Route Table for DB subnets
resource "aws_route_table" "private_db" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.default.id

  tags = {
    Name    = "private-db-rt-${count.index}-${var.vpc_name}"
    Network = "Private"
  }
}


# Route Table Association for DB subnets
resource "aws_route_table_association" "private_db" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.private_db.*.id, count.index)
  route_table_id = element(aws_route_table.private_db.*.id, count.index)
}
