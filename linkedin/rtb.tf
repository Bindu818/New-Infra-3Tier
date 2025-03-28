# Create a Route Table
resource "aws_route_table" "linkedin-web-rt" {
  vpc_id = aws_vpc.linkedn-vpc.id
  tags = {
    Name = "linkedin-web-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.linkedin-igw.id
  }
}

resource "aws_route_table" "linkedin-app-rt" {
  vpc_id = aws_vpc.linkedin-vpc.id
  tags = {
    Name = "linkedin-app-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.linkedin-natgw-01.id
  }
}

# Route Table Association
resource "aws_route_table_association" "linkedin-rt-as-1" {
  subnet_id      = aws_subnet.linkedin-pub-sub-1.id
  route_table_id = aws_route_table.linkedin-web-rt.id
}

resource "aws_route_table_association" "linkedin-rt-as-2" {
  subnet_id      = aws_subnet.linkedin-pub-sub-2.id
  route_table_id = aws_route_table.linkedin-web-rt.id
}

resource "aws_route_table_association" "linkedin-rt-as-3" {
  subnet_id      = aws_subnet.linkedin-pvt-sub-1.id
  route_table_id = aws_route_table.linkedin-app-rt.id
}
resource "aws_route_table_association" "linkedin-rt-as-4" {
  subnet_id      = aws_subnet.linkedin-pvt-sub-2.id
  route_table_id = aws_route_table.linkedin-app-rt.id
}

resource "aws_route_table_association" "linkedin-rt-as-5" {
  subnet_id      = aws_subnet.linkedin-pvt-sub-3.id
  route_table_id = aws_route_table.linkedin-app-rt.id
}
resource "aws_route_table_association" "linkedinrt-as-6" {
  subnet_id      = aws_subnet.linkedin-pvt-sub-4.id
  route_table_id = aws_route_table.linkedin-app-rt.id
}

# Create an Elastic IP address for the NAT Gateway
resource "aws_eip" "linkedin-nat-eip" {
  domain = "vpc"
  tags = {
    Name = "linkedin-nat-eip"
  }
}
