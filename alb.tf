
## ALB
resource "aws_alb_target_group" "sample_target_group" {
  name     = "sample-ecs-tg"
  port     = 3333
  protocol = "TCP"
  vpc_id   = "${var.vpc_id}"
}

resource "aws_alb_target_group" "sample_target_group_amadeus" {
  name     = "sample-ecs-tg"
  port     = 3334
  protocol = "TCP"
  vpc_id   = "${var.vpc_id}"
}

resource "aws_lb" "main" {
  load_balancer_type = "network"
  name            = "sample-alb-ecs"
  subnets         = ["${var.subnet_2}",  "${var.subnet_1}"]
  }

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = "${aws_lb.main.id}"
  port              = "3333"
  protocol          = "TCP"

  default_action {
    target_group_arn = "${aws_alb_target_group.sample_target_group.id}"
    type             = "forward"
  }
}

resource "aws_alb_listener" "front_end_amadeus" {
  load_balancer_arn = "${aws_lb.main.id}"
  port              = "3334"
  protocol          = "TCP"

  default_action {
    target_group_arn = "${aws_alb_target_group.sample_target_group_amadeus.id}"
    type             = "forward"
  }
}