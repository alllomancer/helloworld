resource "aws_lb" "test" {
  load_balancer_type = "network"

  name         = "test"
  subnets      = ["${data.aws_subnet.public.*.id}"]
  internal     = false
  idle_timeout = 305

  enable_cross_zone_load_balancing = true

  tags {
    Name        = "test"
  }
}

resource "aws_lb_target_group" "test" {
  name     = "test"
  port     = 80
  protocol = "TCP"
  vpc_id   = "${data.aws_vpc.current.id}"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 30
    protocol            = "TCP"
    port                = "80"
  }
}

resource "aws_lb_listener" "test" {
  load_balancer_arn = "${aws_lb.test.arn}"
  port              = "80"
  protocol          = "TCP"

  default_action {
    target_group_arn = "${aws_lb_target_group.test.arn}"
    type             = "forward"
  }
}