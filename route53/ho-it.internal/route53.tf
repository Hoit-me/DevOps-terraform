resource "aws_route53_zone" "ho-it_internal" {
  name = "ho-it.internal"
  vpc {
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  }
}

output "ho-it_internal_name_servers" {
  value = aws_route53_zone.ho-it_internal.name_servers
}

output "ho-it_internal_zone_id" {
  value = aws_route53_zone.ho-it_internal.zone_id
}
output "ho-it_internal_zone_name" {
  value = aws_route53_zone.ho-it_internal.name
}
