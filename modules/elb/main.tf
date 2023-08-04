resource "aws_elb" "elb" {
  name = "foobar-terraform-elb"
  #if using subnet(for vpc), availability zones should be disabled
  #availability_zones = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = var.instance_id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  subnets                     = var.subnet_id
  security_groups             = var.security_group

  tags = {
    Name = "foobar-terraform-elb"
  }
}
