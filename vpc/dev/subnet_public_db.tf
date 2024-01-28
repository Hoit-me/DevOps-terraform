## DB PUBLIC SUBNETS
# resource "aws_subnet" "public_db" {
#   count  = length(var.availability_zones)
#   vpc_id = aws_vpc.default.id

#   cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_public_db[count.index]}.0/20"
#   availability_zone = element(var.availability_zones, count.index)

#   tags = {
#     Name = "db-public${count.index}-${var.vpc_name}"
#   }

# }
# resource "aws_route_table" "public_db" {
#   count  = length(var.availability_zones)
#   vpc_id = aws_vpc.default.id

#   tags = {
#     Name = "publicdb${count.index}rt-${var.vpc_name}"
#   }
# }

# resource "aws_route_table_association" "public_db" {
#   count          = length(var.availability_zones)
#   subnet_id      = element(aws_subnet.public_db.*.id, count.index)
#   route_table_id = element(aws_route_table.public_db.*.id, count.index)
# }


