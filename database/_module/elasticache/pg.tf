resource "aws_elasticache_parameter_group" "ec" {
  name        = var.parameter_group_name
  description = var.parameter_group_description

  # Please use the right engine and version
  family = var.parameter_group_family

  # List of cluster parameters
  dynamic "parameter" {
    for_each = var.parameter_group_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}
