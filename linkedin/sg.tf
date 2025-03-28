# Security Group for ASG
resource "aws_security_group" "linkedin-ec2-asg-sg" {
  name        = "linkedin-ec2-asg-sg"
  description = "Security group for EC2 instances in ASG"
  vpc_id      = aws_vpc.linkedin-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "linkedin-ec2-asg-sg"
  }
}


# Security Group for Database
resource "aws_security_group" "linkedin-db-sg" {
  name        = "linkedin-db-sg"
  description = "Security group for linkedin Database"
  vpc_id      = aws_vpc.linkedin-vpc.id

  ingress {
    from_port = 3306 # MySQL/Aurora port
    to_port   = 3306
    protocol  = "tcp"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "linkedin DB SG"
  }
}

# Security Group for Application Load Balancer
resource "aws_security_group" "linkedin-alb-sg-1" {
  name        = "linkedin-alb-sg-1"
  description = "Security group for linkedin Application Load Balancer"
  vpc_id      = aws_vpc.linkedin-vpc.id

  ingress {
    from_port   = 80 # HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443 # HTTPS
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "linkedin ALB SG"
  }
}

# Create a Security Group for ASG
resource "aws_security_group" "linkedin-ec2-asg-sg-app" {
  name        = "linkedin-ec2-asg-sg-app"
  description = "Security group for linkedin EC2 instances in ASG"
  vpc_id      = aws_vpc.linkedin-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "linkedin-ec2-asg-sg-app"
  }
}
