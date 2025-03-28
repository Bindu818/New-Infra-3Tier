# VPC
resource "aws_vpc" "linkedin-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "linkedin-vpc"
  }
}
