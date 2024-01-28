resource "aws_instance" "bastion" {
  count = length(data.terraform_remote_state.vpc.outputs.availability_zones)

  ami                  = "ami-0c2d3e23e757b5d84"
  instance_type        = var.EC2_TYPE.t2nano
  iam_instance_profile = aws_iam_instance_profile.bastion.name
  network_interface {
    device_index         = 0
    network_interface_id = element(data.terraform_remote_state.vpc.outputs.nat_network_interface_ids, count.index)
  }
  tags = {
    Name = "bastion"
  }
}





# resource "aws_route_table" "nat_rt" {
#   vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
# }

# resource "aws_instance" "test" {
#   ami                  = var.AWS_AMI_LIST.ubuntu_22_04_x86
#   instance_type        = var.EC2_TYPE.t2micro
#   subnet_id            = element(data.terraform_remote_state.vpc.outputs.private_subnets, 0)
#   iam_instance_profile = aws_iam_instance_profile.bastion.name
# }

