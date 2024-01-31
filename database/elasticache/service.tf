module "template" {
  source               = "../_module/elasticache"
  replication_group_id = "redis"
  description          = "redis"
  node_type            = "cache.t3.micro"
  ec_tag = {
    Name    = "hoit-redis"
    project = "hoit"
    role    = "redis"
    stack   = "hoit"
  }
  automatic_failover_enabled = true
  port                       = 6379
  engine                     = "redis"
  engine_version             = "7.0"


  zone_id        = data.terraform_remote_state.route53-ho-it_internal.outputs.ho-it_internal_zone_id
  ec_record_name = "redis.${data.terraform_remote_state.route53-ho-it_internal.outputs.ho-it_internal_zone_name}"
  ttl            = "300"

  vpc_id         = data.terraform_remote_state.vpc.outputs.vpc_id
  sg_description = "VPC for hoit"
  cidr_blocks = [
    "10.${data.terraform_remote_state.vpc.outputs.cidr_numeral}.0.0/16",
  ]
  sg_name = "ec-sg"

  sg_tag = {
    Name    = "ec-sg"
    project = "hoit"
    role    = "redis"
    stack   = "hoit"
  }

  parameter_group_name        = "hoit-redis"
  parameter_group_description = "hoit redis"
  parameter_group_family      = "redis7"

  parameter_group_parameters = [
    {
      name  = "cluster-enabled"
      value = "yes"
    },
  ]

  subnet_group_name        = "redis-cluster"
  subnet_ids               = data.terraform_remote_state.vpc.outputs.private_subnets
  subnet_group_description = "hoit redis"


}
