resource "aws_appautoscaling_target" "esc_target_cpu" {
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  resource_id        = "service/${aws_ecs_cluster.cluster.name}/${aws_ecs_service.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}


resource "aws_appautoscaling_policy" "esc_policy_memory" {
  name               = "${var.service_name}-esc-policy-memory"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.esc_target_cpu.resource_id
  scalable_dimension = aws_appautoscaling_target.esc_target_cpu.scalable_dimension
  service_namespace  = aws_appautoscaling_target.esc_target_cpu.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
    scale_in_cooldown  = var.memory_scale_in_cooldown
    scale_out_cooldown = var.memory_scale_out_cooldown
    target_value       = var.memory_limit
  }
}

resource "aws_appautoscaling_policy" "esc_policy_cpu" {
  name               = "${var.service_name}-esc-policy-cpu"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.esc_target_cpu.resource_id
  scalable_dimension = aws_appautoscaling_target.esc_target_cpu.scalable_dimension
  service_namespace  = aws_appautoscaling_target.esc_target_cpu.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown  = var.cpu_scale_in_cooldown
    scale_out_cooldown = var.cpu_scale_out_cooldown
    target_value       = var.cpu_limit
  }
}
```
