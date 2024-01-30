resource "aws_alb" "aws_alb_demo" {
  name                       = "aws-alb-demo"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.allow_http_https.id]
  subnets                    = ["subnet-0b7fe7a548bced05f"]
}

resource "aws_security_group" "allow_http_https" {
  name        = "allow-inbound-http-https"
  description = "Allow HTTP and HTTPS inbound traffic"
  vpc_id      = "vpc-011c98b371f543c54"

  ingress = [
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "HTTP"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "HTTPS"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}
