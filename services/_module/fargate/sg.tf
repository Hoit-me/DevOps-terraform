################## Security Group for ecs
resource "aws_security_group" "ecs" {
  name        = "${var.service_name}-${var.vpc_name}"
  description = "${var.service_name} Instance Security Group"
  vpc_id      = var.target_vpc

  # Service Port will be passed via variable.
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    # Allow external LB Only for ec2 instance
    security_groups = [
      aws_security_group.external_lb.id,
    ]

    description = "Port Open for ${var.service_name}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Internal outbound traffic"
  }

  tags = {
    Name  = "${var.service_name}-${var.vpc_name}-sg"
    app   = var.service_name
    stack = var.vpc_name
  }
}
