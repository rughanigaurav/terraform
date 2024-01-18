resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr[count.index]
  availability_zone = var.az[count.index]
  count = 2

  tags = {
    Name = "public-sub"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr[count.index]
  availability_zone = var.az[0]
  count = 2

  tags = {
    Name = "private-sub3"
  }
}

data "aws_subnets" "tts" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.main.id]
  }

  tags = {
    Tier = "Public"
  }
}