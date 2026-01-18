resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.128/25"

  tags = {
    "Name"          = "devops-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/25"

  tags = {
    "Name"          = "devops-private-subnet"
  }
}