###### Create an EC2 Auto Scaling Group for LinkedIn App ######
resource "aws_autoscaling_group" "linkedin-web-asg" {
  name = "linkedin-web-asg"
  launch_template {
    id      = aws_launch_template.linkedin-web-template.id
    version = "$Latest"
  }
  vpc_zone_identifier = [aws_subnet.linkedin-pub-sub-1.id, aws_subnet.linkedin-pub-sub-2.id]
  min_size            = 2
  max_size            = 3
  desired_capacity    = 2
}

###### Create a Launch Template for the EC2 instances ######
resource "aws_launch_template" "linkedin-web-template" {
  name_prefix   = "linkedin-web-template"
  image_id      = "ami-0ed194d7eff6d2f81"  # You can change this to the specific AMI you want to use
  instance_type = "t2.micro"
  key_name      = "Bindukp"  # Use your actual key name or PEM file associated with EC2 instance
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.linkedin-ec2-asg-sg.id]
  }
  user_data = base64encode(file("apache.sh"))  # Assumes you have a script file "apache.sh" for EC2 configuration
  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}
