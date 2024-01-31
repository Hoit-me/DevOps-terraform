# module "template" {
#   source               = "..//_module/elastic_cache"
#   replication_group_id = "hoit-redis"
#   description          = "hoit redis"
#   node_type            = "cache.t3.micro"
#   ec_tag = {
#     Name    = "hoit-redis"
#     project = "hoit"
#     role    = "redis"
#     stack   = "hoit"
#   }
#   automatic_failover_enabled = true
#   port                       = 6379
#   engine                     = "redis"
#   engine_version             = "7.0"
#   availability_zones =    [
#     "ap-northeast-2a",
#     "ap-northeast-2c",
#   "]
#   num_cache_clusters = 1

#   zone_id        = ""
#   ec_record_name = "hoit-redis"
#   ttl            = "300"

#   vpc_id         = "vpc-0c9f9b6b7f7f5f5f5"
#   sg_description = "VPC for hoit"
#   cidr_blocks = [
#     "10.0.0.0/16",
#   ]
#   sg_name = "ec-sg"

#   sg_tag = {
#     Name    = "ec-sg"
#     project = "hoit"
#     role    = "redis"
#     stack   = "hoit"
#   }

#   parameter_group_name        = "hoit-redis"
#   parameter_group_description = "hoit redis"
#   parameter_group_family      = "redis7.x"

#   parameter_group_parameters = [
#     {
#       name  = "maxmemory-policy",
#       value = "allkeys-lru"
#       }, {
#       name  = "maxmemory",
#       value = "1000000000"

#     }
#   ]

#   subnet_group_name        = "hoit-redis"
#   subnet_group_description = "hoit redis"
#   subnet_ids = [
#     "subnet-0c9f9b6b7f7f5f5f5",
#     "subnet-0c9f9b6b7f7f5f5f5"
#   ]


# }
