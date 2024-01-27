output "ext_alb" {
  value = aws_lb.external
}

output "dev_medicine_search_server_lb_tg" {
  value = aws_lb_target_group.dev_medicine_search_server
}
