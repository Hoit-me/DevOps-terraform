#### PRIVATE SUBNETS
# Subnet will use cidr with /20 -> The number of available IP is 4,096  (Including reserved ip from AWS)
resource "aws_subnet" "private" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.default.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_private[count.index]}.0/20"
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name    = "private-${count.index}-${var.vpc_name}"
    Network = "Private"
  }
}

# Route Table for private subnets
resource "aws_route_table" "private" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.default.id

  tags = {
    Name    = "private-rt-${count.index}-${var.vpc_name}"
    Network = "Private"
  }
}

# Route Table Association for private subnets
resource "aws_route_table_association" "private" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}
