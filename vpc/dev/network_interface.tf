resource "aws_network_interface" "nat_instance" {
  count             = length(var.availability_zones)
  subnet_id         = element(aws_subnet.public.*.id, count.index)
  security_groups   = [aws_security_group.bastion.id]
  source_dest_check = false
  tags = {
    Name = "nat-interface-${count.index}"
  }
}


