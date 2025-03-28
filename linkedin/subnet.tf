provider "aws" {
  region = "us-east-1"
}

# Public Subnets for LinkedIn App
resource "aws_subnet" "linkedin-pub-sub-1" {
  vpc_id                  = aws_vpc.linkedin-vpc.id
  cidr_block              = "10.0.0.0/28"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "linkedin-pub-sub-1"
  }
}

resource "aws_subnet" "linkedin-pub-sub-2" {
  vpc_id                  = aws_vpc.linkedin-vpc.id
  cidr_block              = "10.0.0.16/28"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "linkedin-pub-sub-2"
  }
}

# Private Subnets for LinkedIn App
resource "aws_subnet" "linkedin-pvt-sub-1" {
  vpc_id                  = aws_vpc.linkedin-vpc.id
  cidr_block              = "10.0.0.32/28"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "linkedin-pvt-sub-1"
  }
}

resource "aws_subnet" "linkedin-pvt-sub-2" {
  vpc_id                  = aws_vpc.linkedin-vpc.id
  cidr_block              = "10.0.0.48/28"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "linkedin-pvt-sub-2"
  }
}

resource "aws_subnet" "linkedin-pvt-sub-3" {
  vpc_id                  = aws_vpc.linkedin-vpc.id
  cidr_block              = "10.0.0.64/28"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "linkedin-pvt-sub-3"
  }
}
