resource "aws_elasticache_subnet_group" "ec" {
  name        = var.subnet_group_name
  description = var.subnet_group_description
  subnet_ids  = var.subnet_ids
}
