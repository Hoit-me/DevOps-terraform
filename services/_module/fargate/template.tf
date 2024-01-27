# module "template" {
#     source = "../_module/fargate"

#     service_name = "template"
#     aws_ecr_repository = "template"
#     cpu = 256
#     memory = 512
#     desired_count = 1
#     container_port = 80
#     tpl_path = "../_module/fargate/template/service.config.json.tpl"


#     private_subnets = ["subnet-0a0a0a0a0a0a0a0a0", "subnet-0a0a0a0a0a0a0a0a0"]
#     target_vpc = "vpc-0a0a0a0a0a0a0a0a0"

#     lb_target_group_arn = "arn:aws:elasticloadbalancing:ap-northeast-2:000000000000:targetgroup/template/0a0a0a0a0a0a0a0a0"

#     security_groups = ["sg-0a0a0a0a0a0a0a0a0"]

#     max_capacity = 2
#     min_capacity = 1
#     memory_scale_in_cooldown = 60
#     memory_scale_out_cooldown = 60
#     memory_limit = 70
#     cpu_scale_in_cooldown = 60
#     cpu_scale_out_cooldown = 60
#     cpu_limit = 70


# }
