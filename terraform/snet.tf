resource "aws_subnet" "devops-private-subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/25"

  tags = {
    "Name"          = "devops-private-subnet"
  }
}

resource "aws_subnet" "devops-public-subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.128/25"

  tags = {
    "Name"          = "devops-public-subnet)"
  }
}