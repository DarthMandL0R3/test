resource "aws_eip" "nat" {
  # vpc = true
  tags = {
    Name = "devops-ngw"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.devops-public-subnet.id

  tags = {
    Name = "devops-ngw"
  }

  depends_on = [aws_internet_gateway.igw]
}