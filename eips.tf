resource "aws_eip" "NAT_eip" {
  depends_on = [aws_internet_gateway.internet_gateway]
  tags = {
    Name="NAT Gateway EIP"
  }

}
