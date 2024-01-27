module "medicine_search_server" {
  source              = "../_module/fargate"
  service_name        = "medicine-search-server"
  aws_ecr_repository  = data.terraform_remote_state.ecr.medicine_search_server_ecr_url
  container_port      = var.service_port
  target_vpc          = data.terraform_remote_state.vpc.vpc_id
  private_subnets     = data.terraform_remote_state.vpc.private_subnets
  lb_target_group_arn = data.terraform_remote_state.lb.medicine_search_server_lb_target_group_arn
  security_groups     = [data.terraform_remote_state.vpc.default_security_group_id]
}
