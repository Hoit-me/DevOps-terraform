# #################### Route53 Record
resource "aws_route53_record" "dev_medicine_search_server" {
  zone_id        = var.r53_variables.ho-it_me_zone_id
  name           = "dev.search"
  type           = "A"
  set_identifier = var.AWS_REGION

  latency_routing_policy {
    region = var.AWS_REGION
  }

  alias {
    name                   = data.terraform_remote_state.alb.outputs.ext_alb.dns_name
    zone_id                = data.terraform_remote_state.alb.outputs.ext_alb.zone_id
    evaluate_target_health = true
  }
}
