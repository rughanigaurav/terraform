resource "aws_db_subnet_group" "db-subnet-group" {
    
    name = "kg-subnet"
    subnet_ids = [aws_route_table_association.private_subnet_1_route_table_association,aws_subnet.private_app_subnet_az2,aws_subnet.public_subnet_az1,aws_subnet.public_subnet_az2 ]
    description = "Subnet for RDS"
    tags = {
      
      Name = "default-vpc-0217757ec8c0923c7"
    } 
}
