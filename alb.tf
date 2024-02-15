#Frontend ALB
resource "aws_lb" "Frontend_alb" {
  name               = "Frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = aws_security_group.security_group
  subnets =  [aws_subnet.public_subnet_az1 , aws_subnet.public_subnet_az2]
  access_logs {
    
    bucket = "aws_s3_bucket.access_logs"
    prefix = "alb"
    enabled = true

  }

  subnet_mapping {
    subnet_id = aws_subnet.public_subnet_az1
  }

  subnet_mapping {
    subnet_id = aws_subnet.public_subnet_az2
  }

  enable_deletion_protection = false

  tags   = {
    Name = "Frontend-ALB"
  }
}

#Frontend ALB Target Group
resource "aws_lb_target_group" "Frontend-alb_target_group" {
  name        = "Frontend-TG"
  target_type = "instance"
  port        = 80
  protocol    = "tcp"
  vpc_id      = aws_vpc.vpc.id

  health_check {
    healthy_threshold   = 5
    interval            = 30
    path                = "/"
    port                = 80
    protocol            = "tcp"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

# Frontend ALB Listner Group
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.Frontend_alb.arn
  port              = 80
  protocol          = "tcp"

  default_action {
    type = "redirect"

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# create a listener on port 443 with forward action
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn  = aws_lb.Frontend_alb.arn
  port               = 443
  protocol           = "HTTPS"
  certificate_arn    = "arn:aws:acm:us-east-1:817580110216:certificate/e7adaa41-fcbc-4d69-928b-e087e430e180"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Frontend-alb_target_group.arn
  }
}
# Backend Loadbalancer
resource "aws_lb" "Backend_alb" {
  name               = "Backend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group]
  subnets            = [ aws_subnet.public_subnet_az1,aws_subnet.public_subnet_az2 ]

  subnet_mapping {
    subnet_id = aws_subnet.public_subnet_az1
  }

  subnet_mapping {
    subnet_id = aws_subnet.public_subnet_az2
  }

  enable_deletion_protection = false

  tags   = {
    Name = "Frontend-ALB"
  }
}

# create target group for Backend ALB

resource "aws_lb_target_group" "Backend-alb_target_group" {
  name        = "Backend-TG"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id

  health_check {
    healthy_threshold   = 5
    interval            = 30
    path                = "/"
    port                = 80
    protocol            = "tcp"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

# create a listener on port 80 with redirect action
resource "aws_lb_listener" "alb_http1_listener" {
  load_balancer_arn = aws_lb.Backend_alb.arn
  port              = 80
  protocol          = "tcp"

  default_action {
    type = "redirect"

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# create a listener on port 443 with forward action
resource "aws_lb_listener" "alb_https1_listener" {
  load_balancer_arn  = aws_lb.Backend_alb.arn
  port               = 443
  protocol           = "HTTPS"
  certificate_arn    = "arn:aws:acm:us-east-1:817580110216:certificate/e7adaa41-fcbc-4d69-928b-e087e430e180"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Backend-alb_target_group.arn
  }
}