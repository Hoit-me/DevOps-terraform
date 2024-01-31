resource "aws_elasticache_replication_group" "ec" {

  replication_group_id        = var.replication_group_id
  description                 = var.description
  node_type                   = var.node_type
  preferred_cache_cluster_azs = var.availability_zones
  num_cache_clusters          = var.num_cache_clusters
  port                        = var.port
  engine                      = var.engine
  engine_version              = var.engine_version

  subnet_group_name = aws_elasticache_subnet_group.ec.name

  security_group_ids = [
    aws_security_group.ec.id,
  ]

  parameter_group_name = aws_elasticache_parameter_group.ec.name

  automatic_failover_enabled = var.automatic_failover_enabled

  tags = var.ec_tag
}

resource "aws_route53_record" "ec_record" {
  zone_id = var.zone_id
  name    = var.ec_record_name
  type    = "CNAME"
  ttl     = var.ttl
  records = [
    aws_elasticache_replication_group.ec.configuration_endpoint_address,
  ]
}
