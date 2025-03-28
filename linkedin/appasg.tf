# Create an EC2 Auto Scaling Group - app
resource "aws_autoscaling_group" "linkedin-app-asg" {
  name = "linkedin-app-asg"

  launch_template {
    id      = aws_launch_template.linkedin-app-template.id
    version = "$Latest"
  }

  vpc_zone_identifier = [
    aws_subnet.linkedin-pvt-sub-1.id,
    aws_subnet.linkedin-pvt-sub-2.id
  ]

  min_size         = 2
  max_size         = 3
  desired_capacity = 2
}

# Create a launch template for the EC2 instances
resource "aws_launch_template" "linkedin-app-template" {
  name_prefix   = "linkedin-app-template"
  image_id      = "ami-02f624c08a83ca16f"
  instance_type = "t2.micro"
  key_name      = "bindukp"

  network_interfaces {
    security_groups             = [aws_security_group.linkedin-ec2-asg-sg-app.id]
    associate_public_ip_address = false
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash

    sudo yum install mysql -y
  EOF
  )

  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}
