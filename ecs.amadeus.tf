## ECS

data "template_file" "task_definition_amadeus" {
  template = "${file("${path.module}/task-definition.amadeus.json")}"

  vars = {
    image_url        = "${var.image_url}"
    container_name   = "sample-amadeus"
    log_group_region = "${var.aws_region}"
    log_group_name   = "${aws_cloudwatch_log_group.app.name}"
  }
}

resource "aws_ecs_task_definition" "sample_task_amadeus" {
  family                = "sample-task-amadeus"
  container_definitions = "${data.template_file.task_definition_amadeus.rendered}"
}

resource "aws_ecs_service" "sample_service_amadeus" {
  name            = "sample-service-amadeus"
  cluster         = "${aws_ecs_cluster.main.id}"
  task_definition = "${aws_ecs_task_definition.sample_task_amadeus.arn}"
  desired_count   = 2
  iam_role        = "${aws_iam_role.ecs_service.arn}"

  load_balancer {
    target_group_arn = "${aws_alb_target_group.sample_target_group_amadeus.id}"
    container_name   = "sample-amadeus"
    container_port   = "3334"
  }

  depends_on = [
    "aws_alb_listener.front_end_amadeus",
  ]
}