resource "aws_nat_gateway" "KG-Tiger-NAT" {
  subnet_id = aws_subnet.public_subnet_az1
  allocation_id = aws_eip.NAT_eip

tags = {

    Name = "KG-Tiger-NAT" 
}
}

resource "aws_route_table" "Private_RT" {
    vpc_id = aws_vpc.vpc.id

    route = {

        cidr_block  = "0.0.0.0/0"
        gateway_id  = aws_nat_gateway.KG-Tiger-NAT.id

    tags = {

        Name ="Private Route table"
    }
    }
  
}