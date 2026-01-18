############################################
# Public Route Table (no inline routes)
############################################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "devops-public-rt"
  }
}

# Default route to Internet via IGW (IPv4)
resource "aws_route" "public_default_ipv4" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

  # Helps with eventual consistency if IGW was just created
  depends_on = [aws_internet_gateway.igw]
}


############################################
# Private Route Table (no inline routes)
############################################

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "devops-private-rt"
  }
}

# Default egress via NAT (IPv4)
resource "aws_route" "private_default_ipv4" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id

  # Avoids timing issues when NAT EIP/ENI is not yet fully ready
  depends_on = [aws_nat_gateway.nat]
}


############################################
# Associations (keep as-is)
############################################

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
