# resource "aws_eip" "nat_eip" {
#   count = length(var.availability_zones)
#   tags = {
#     Name = "nat-eip-${var.vpc_name}-${var.availability_zones[count.index]}"
#   }
# }

# resource "aws_nat_gateway" "nat_gateway" {
#   count         = length(var.availability_zones)
#   allocation_id = aws_eip.nat_eip[count.index].id
#   subnet_id     = aws_subnet.public[count.index].id
#   tags = {
#     Name = "nat-gateway-${var.vpc_name}-${var.availability_zones[count.index]}"
#   }
# }

# resource "aws_route" "nat_gateway" {
#   count                  = length(var.availability_zones)
#   route_table_id         = element(aws_route_table.private.*.id, count.index)
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = element(aws_nat_gateway.nat_gateway.*.id, count.index)

# }
