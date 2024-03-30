resource "aws_nat_gateway" "test-NAT" {
  subnet_id = aws_subnet.public_subnet_az1
  allocation_id = aws_eip.NAT_eip
tags = {

    Name = "test-NAT" 
}
}
resource "aws_route_table" "Private_RT" {
    vpc_id = aws_vpc.vpc.id
    route = [{

        cidr_block  = "0.0.0.0/0"
        gateway_id  = aws_nat_gateway.test-NAT.id
        carrier_gateway_id         = ""
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
        core_network_arn = ""
}]
    tags = {

        Name ="Private Route table"
    } 
}