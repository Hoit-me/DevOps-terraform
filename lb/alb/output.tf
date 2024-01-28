output "ext_alb" {
  value = aws_alb.external
}

output "dev_medicine_search_server_lb_tg" {
  value = aws_lb_target_group.dev_medicine_search_server
}

output "ext_lb_sg" {
  value = aws_security_group.external_lb
}
