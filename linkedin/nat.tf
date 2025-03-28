#NatGW
resource "aws_nat_gateway" "linkedin-natgw-01" {
  allocation_id = aws_eip.linkedin-nat-eip.id
  subnet_id     = aws_subnet.linkedin-pub-sub-1.id

  tags = {
    Name = "linkedin-natgw-01"
  }
  depends_on = [aws_internet_gateway.linkedin-igw]
}

