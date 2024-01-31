
resource "aws_security_group" "ec" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
    description = "Internal redis service port outbound"
  }

  tags = var.sg_tag
}
