
## ALB
resource "aws_alb_target_group" "sample_target_group" {
  name     = "sample-ecs-tg"
  port     = 8443
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
}

resource "aws_alb" "main" {
  name            = "sample-alb-ecs"
  subnets         = ["${var.subnet_2}",  "${var.subnet_1}"]
  security_groups = ["${var.security_group_2}", "${var.security_group_1}"]
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = "${aws_alb.main.id}"
  port              = "8443"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.sample_target_group.id}"
    type             = "forward"
  }
}