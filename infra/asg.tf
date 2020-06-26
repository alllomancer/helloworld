
resource "aws_launch_configuration" "test" {
  name_prefix = "test-"
  image_id    = "ami-026dea5602e368e96"

  instance_type = "t2.micro"
  key_name      = "voca"


  security_groups = [
    "${aws_security_group.test.id}",
  ]


  root_block_device {
    volume_type           = "gp2"
    volume_size           = 32
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<END_OF_USER_DATA
#!/bin/bash
export PATH=/usr/local/bin:$PATH;

yum update
yum install docker -y
service docker start
amazon-linux-extras install nginx1.12
wget https://raw.githubusercontent.com/alllomancer/helloworld/master/nginx.conf -O /etc/nginx/nginx.conf
service nginx start
docker run -i -p 8080:8080 alllomancer/helloworld
END_OF_USER_DATA
}

resource "aws_autoscaling_group" "test" {
  name = "test"

  min_size = "1"
  max_size = "1"

  launch_configuration = "${aws_launch_configuration.test.name}"
  vpc_zone_identifier  = ["${data.aws_subnet_ids.public.ids}"]
  default_cooldown     = 300
  termination_policies = ["OldestInstance"]

  target_group_arns = [
    "${aws_lb_target_group.test.arn}",
  ]

  tag {
    key                 = "ServerClass"
    value               = "test"
    propagate_at_launch = true
  }

}
