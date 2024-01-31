resource "aws_launch_template" "launch_template_frontend" {
  name          = "Frontend-Image"
  image_id      = "var.ami"
  instance_type = "var.instance_type"
  network_interfaces {
    device_index    = 0
    security_groups = ["aws_security_group.security_group.id"]
  }
  tag_specifications {
    resource_type = "instance"

    tags = {
    Name = "Frontend-Image"
    }
  }
}
resource "aws_launch_template" "launch_template_backend" {
  name          = "Backend-Image"
  image_id      = "var.ami"
  instance_type = "var.instance_type"

  network_interfaces {
    device_index    = 0
    security_groups = ["aws_security_group.security_group.id"]
  }
  tag_specifications {
    resource_type = "instance"

    tags = {
    Name = "Backend-Image"
    }
  }
}



