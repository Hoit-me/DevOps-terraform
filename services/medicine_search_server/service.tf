module "medicine_search_server" {
  source              = "../_module/fargate"
  service_name        = "medicine-search-server"
  aws_ecr_repository  = data.terraform_remote_state.ecr.outputs.medicine_search_server_ecr_url
  container_port      = var.service_port
  target_vpc          = data.terraform_remote_state.vpc.outputs.vpc_id
  private_subnets     = data.terraform_remote_state.vpc.outputs.private_subnets
  lb_target_group_arn = data.terraform_remote_state.alb.outputs.dev_medicine_search_server_lb_tg.arn
  security_groups     = [data.terraform_remote_state.alb.outputs.ext_lb_sg.id]
}
