resource "aws_lb_target_group" "dev_medicine_search_server" {
  name                 = "medicine-search-server-${data.terraform_remote_state.vpc.outputs.shard_id}-ext"
  port                 = 8000
  target_type          = "ip"
  protocol             = "HTTP"
  vpc_id               = data.terraform_remote_state.vpc.outputs.vpc_id
  slow_start           = var.lb_variables.target_group_slow_start[data.terraform_remote_state.vpc.outputs.shard_id]
  deregistration_delay = var.lb_variables.target_group_deregistration_delay[data.terraform_remote_state.vpc.outputs.shard_id]
  tags                 = var.lb_variables.external_lb_tg.tags[data.terraform_remote_state.vpc.outputs.shard_id]["medicine_search_server"]
  health_check {
    port                = "traffic-port"
    path                = "/api/health-check"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 10
    interval            = 100
    matcher             = "200-399"
  }
}

resource "aws_lb_listener_rule" "dev_medicine_search_server" {
  listener_arn = aws_lb_listener.external_443.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dev_medicine_search_server.arn
  }
  condition {
    host_header {
      values = ["dev.search.${data.terraform_remote_state.route53-ho-it_me.outputs.ho-it_me_zone_name}"]
    }
  }
}
