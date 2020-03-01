# ---------------------------------------------------------------------------------------------------------------------
# GET THE LIST OF AVAILABILITY ZONES IN THE CURRENT REGION
# Every AWS account has slightly different availability zones in each region. For example, one account might have
# us-east-1a, us-east-1b, and us-east-1c, while another will have us-east-1a, us-east-1b, and us-east-1d. This resource
# queries AWS to fetch the list for the current account and region.
# ---------------------------------------------------------------------------------------------------------------------

data "aws_availability_zones" "available" {
  state = "available"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A LAUNCH CONFIGURATION THAT DEFINES EACH EC2 INSTANCE IN THE ASG
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_launch_configuration" "webserver" {
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups    = ["sg-05e2fc37efa0768aa"]
  user_data = "data.template_file.user_data.rendered"
  lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "user_data" {
  template = "file(path.module}/user-data.sh)"

}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE AUTO SCALING GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_autoscaling_group" "webserver" {
  launch_configuration = aws_launch_configuration.webserver.id
  availability_zones   = data.aws_availability_zones.available.names
  load_balancers     = ["terraform-asg-webserver"]
  health_check_type    = "ELB"
  min_size         = var.min_size
  max_size         = var.max_size
  min_elb_capacity = var.min_size

    lifecycle {
      create_before_destroy = true
    }

    tag {
      key                 = "Name"
      value               = var.cluster_name
      propagate_at_launch = true
    }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN ELB TO ROUTE TRAFFIC ACROSS THE AUTO SCALING GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_elb" "webserver" {
  name               = var.cluster_name
  availability_zones = data.aws_availability_zones.available.names

  security_groups    = ["sg-05e2fc37efa0768aa"]
  health_check {
      target              = "HTTP:${var.server_port}/"
      interval            = 30
      timeout             = 3
      healthy_threshold   = 2
      unhealthy_threshold = 2
    }

    # This adds a listener for incoming HTTP requests.
    listener {
      lb_port           = var.elb_port
      lb_protocol       = "http"
      instance_port     = var.server_port
      instance_protocol = "http"
    }
   lifecycle {
   create_before_destroy = true
 }

}


# ---------------------------------------------------------------------------------------------------------------------
# ASSOCIATE ELASTIC-IP TO THE LOAD BALANCER
# ---------------------------------------------------------------------------------------------------------------------

#to do
