resource "aws_ecr_repository" "ecr" {
  name = var.name
}

output "ecr_url" {
  value = aws_ecr_repository.ecr.repository_url
}
