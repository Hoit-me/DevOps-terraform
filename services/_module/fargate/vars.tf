##################
# COMMON

variable "service_name" {
  description = "The name of the service."
}

variable "aws_ecr_repository" {
  description = "The name of the ECR repository."
}

variable "cpu" {
  description = "The number of cpu units used by the task."
  default     = 256
}

variable "memory" {
  description = "The amount (in MiB) of memory used by the task."
  default     = 512
}


##################
# AWS ECS

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running."
  default     = 1
}

variable "container_port" {
  description = "The port number on the container that is bound to the user-specified or automatically assigned host port."
  default     = 80
}

variable "tpl_path" {
  description = "The path to the template file."
  default     = "../_module/fargate/template/service.config.json.tpl"
}

##################
# VPC
variable "private_subnets" {
  description = "A list of private subnets inside the VPC."
  type        = list(string)
}

variable "target_vpc" {
  description = "The ID of the VPC."
}

##################
# lb
variable "lb_target_group_arn" {
  description = "The ARN of the target group."
}

##################
# SG
variable "security_groups" {
  description = "The security group IDs."
  type        = list(string)
}

##################
# AWS AutoScaling 
# COMMON
variable "max_capacity" {
  description = "The maximum number of instances in the Auto Scaling group."
  default     = 2
}

variable "min_capacity" {
  description = "The minimum number of instances in the Auto Scaling group."
  default     = 1
}

# MEMORY
variable "memory_scale_in_cooldown" {
  description = "The amount of time, in seconds, after a scale in activity completes before another scale in activity can start."
  default     = 300
}

variable "memory_scale_out_cooldown" {
  description = "The amount of time, in seconds, after a scale out activity completes before another scale out activity can start."
  default     = 300
}

variable "memory_limit" {
  description = "The target value for the metric."
  default     = 50
}

# CPU
variable "cpu_scale_in_cooldown" {
  description = "The amount of time, in seconds, after a scale in activity completes before another scale in activity can start."
  default     = 300
}

variable "cpu_scale_out_cooldown" {
  description = "The amount of time, in seconds, after a scale out activity completes before another scale out activity can start."
  default     = 300
}

variable "cpu_limit" {
  description = "The target value for the metric."
  default     = 50
}
