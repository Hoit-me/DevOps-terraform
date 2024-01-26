### Common
variable "aws_region" {
  description = "The AWS region to deploy the shard storage layer into"
}

variable "billing_tag" {
  description = "The shard's default billing tag"
}

variable "shard_id" {
  description = "Text used to identify shard of infrastructure components. For new shards, this should be only the shard id and should not include the AWS region (e.g. ap01)"
}



### ECS
variable "service_name" {
  description = ""
}

variable "image_id" {
  description = ""
}


### Autoscaling
variable "min_instance_size" {
  description = ""
}
variable "max_instance_size" {
  description = ""
}
variable "desired_capacity" {
  description = ""
}





variable "healthcheck_path" {
  default = "/"
}

variable "service_port" {
  description = "Service Port"
}

variable "healthcheck_port" {
  description = "Healthcheck Port"
}



### SG
variable "home_sg" {
  description = "Office people IP list."
  default     = ""
}


### VPC
variable "target_vpc" {
  description = "The AWS ID of the VPC this shard is being deployed into"
}

variable "vpc_name" {
  description = "The unique VPC name this storage layer belongs to"
}

variable "private_subnets" {
  description = "A comma-delimited list of private subnets for the VPC"
  type        = list(string)
}

variable "public_subnets" {
  description = "A comma-delimited list of public subnets for the VPC"
  type        = list(string)
  default     = []
}


variable "availability_zone" {
  description = ""
  default     = "ap-northeast-2a"
}

variable "vpc_cidr_numeral" {
  description = "The VPC CIDR numeral (e.g. 'n' in 10.n.0.0/16)"
}

### ACM
variable "acm_external_ssl_certificate_arn" {
  description = "ssl cert id"
  default     = ""
}



### LB
variable "ext_lb_ingress_cidrs" {
  description = " Ingress of security group of external load-balancer"
  type        = list(string)
}



### Route53
variable "domain_name" {
  description = "Domain Name"
}


variable "route53_internal_domain" {
  description = "base domain name for internal"
}

variable "route53_internal_zone_id" {
  description = "internal domain zone id"
}

variable "route53_external_zone_id" {
  description = "r53 zone id"
  default     = ""
}
