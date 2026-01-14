resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    # destination_cidr_block = "10.0.0.0/24"
    nat_gateway_id         = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "devops-private-sg"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    # destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "devops-public-sg"
  }
}

resource "aws_route_table_association" "devops-private-subnet" {
  subnet_id      = aws_subnet.devops-private-subnet.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "devops-public-subnet" {
  subnet_id      = aws_subnet.devops-public-subnet.id
  route_table_id = aws_route_table.public.id
}