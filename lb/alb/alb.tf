resource "aws_lb" "external" {
  name     = "hoit-alb-${data.terraform_remote_state.vpc.outputs.shard_id}-external"
  subnets  = data.terraform_remote_state.vpc.outputs.public_subnets
  internal = false

  tags = var.lb_variables.external_lb.tags[data.terraform_remote_state.vpc.outputs.shard_id]
}


# SG
resource "aws_security_group" "external_lb" {
  name        = "common-HTTP-external-lb-${data.terraform_remote_state.vpc.outputs.vpc_name}-ext"
  description = "common-HTTP-external-lb-${data.terraform_remote_state.vpc.outputs.vpc_name}-ext"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  # Only allow access from IPs or SGs you specifiy in ext_lb_ingress_cidrs variables
  # If you don't want to use HTTPS then remove this block
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.ext_lb_ingress_cidrs
    description = "External service https port"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.github_hook_sg_ipv4_cidrs
    description = "External service https port"
  }

  ingress {
    from_port        = 433
    to_port          = 433
    protocol         = "tcp"
    ipv6_cidr_blocks = var.github_hook_sg_ipv6_cidrs
  }


  # Allow 80 port 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ext_lb_ingress_cidrs
    description = "External service http port"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
    description = "Internal outbound any traffic"
  }

  tags = var.sg_variables.external_lb.tags[data.terraform_remote_state.vpc.outputs.shard_id]
}

## ALB Listener
resource "aws_lb_listener" "external_443" {
  load_balancer_arn = aws_lb.external.arn
  port              = "443"
  protocol          = "HTTPS"


  # If you want to use HTTPS, then you need to add certificate_arn here.
  certificate_arn = var.r53_variables.ho-it_me_ssl
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404 Not Found"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener" "external_80" {
  load_balancer_arn = aws_lb.external.arn
  port              = "80"
  protocol          = "HTTP"

  # This is for redirect 80. 
  # This means that it will only allow HTTPS(443) traffic
  default_action {
    type = "redirect"

    redirect {
      port     = "443"
      protocol = "HTTPS"
      # 301 -> Permanant Movement
      status_code = "HTTP_301"
    }
  }
}


