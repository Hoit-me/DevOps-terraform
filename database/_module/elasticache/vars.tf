#####################
# 
#####################


###############################
# Elasticache replication group
###############################
variable "replication_group_id" {
  description = "The replication group identifier. This parameter is stored as a lowercase string"
  default     = "redis-cluster"
}

variable "description" {
  description = "The description of the replication group"
  default     = "Redis cluster"
}

variable "node_type" {
  description = "The compute and memory capacity of the nodes in the node group"
  default     = "cache.t3.micro" // is free tier
}

variable "availability_zones" {
  description = "A list of EC2 availability zones in which the replication group's cache clusters will be created"
  type        = list(string)
  default     = []
}

variable "num_cache_clusters" {
  description = "The number of cache clusters that the replication group will initially have"
  default     = 1 # is free tier
}

variable "ec_tag" {
  default = {
    Name = "redis-cluster"
  }
}

variable "automatic_failover_enabled" {
  description = "Specifies whether a read-only replica is automatically promoted to read/write primary if the existing primary fails"
  default     = true
}

variable "port" {
  description = "The port to allow inbound traffic on"
  default     = 6379
}


variable "engine" {
  description = "The name of the cache engine to be used for this cache cluster"
  default     = "redis"
}

variable "engine_version" {
  description = "The version number of the cache engine to be used for this cache cluster"
  default     = "7.0"
}

###############################
# Route Record
###############################
variable "zone_id" {
  description = "The ID of the hosted zone to contain this record"
}

variable "ec_record_name" {
  description = "The name of the record"
}

variable "ttl" {
  description = "The TTL of the record"
  default     = "300"
}


###############################
# security group
###############################
variable "vpc_id" {
  description = "The VPC ID"
}
variable "sg_description" {
  description = "The description of the VPC"
  default     = "VPC for hoit"
}

variable "cidr_blocks" {
  description = "The CIDR block"
  type        = list(string)
}

variable "sg_name" {
  description = "The name of the security group"
  default     = "ec-sg"
}

variable "sg_tag" {
  default = {
    Name    = "ec-sg"
    project = "hoit"
    role    = "redis"
    stack   = "hoit"
  }
}


###################################
# aws elasticache parameter group
###################################
variable "parameter_group_name" {
  description = "The name of the parameter group to associate with this replication group"
  default     = "redis-cluster"
}

variable "parameter_group_description" {
  description = "The description of the parameter group"
  default     = "Redis cluster"
}

variable "parameter_group_family" {
  description = "The family of the parameter group"
  default     = "redis7"
}


variable "parameter_group_parameters" {
  type = list(object({
    name  = string
    value = string
  }))
  default = [
    {
      name  = "cluster-enabled"
      value = "yes"
    },
  ]
}


###################################
# aws elasticache subnet group
###################################
variable "subnet_group_name" {
  description = "The name of the subnet group"
  default     = "redis-cluster"
}

variable "subnet_group_description" {
  description = "The description of the subnet group"
  default     = "Redis cluster"
}

variable "subnet_ids" {
  description = "The subnet IDs"
  type        = list(string)
}
