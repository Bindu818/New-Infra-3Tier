# Internet Gateway
resource "aws_internet_gateway" "linkedin-igw" {
  tags = {
    Name = "linkedin-igw"
  }
  vpc_id = aws_vpc.linked-vpc.id
}
