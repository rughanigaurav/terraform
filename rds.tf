resource "aws_db_subnet_group" "db-subnet-group" {

    name = "default"
    subnet_ids = [aws_route_table_association.private_subnet_1_route_table_association,aws_subnet.private_app_subnet_az2,aws_subnet.public_subnet_az1,aws_subnet.public_subnet_az2 ]
    description = "Subnet for RDS"

    tags = {
      
      Name = "Subnet for Database"
    }
  
}

resource "aws_db_instance" "db-instance" {

    instance_class = "${var.databae-instance-class}"
    availability_zone = us-east-1b
    identifier = "${var.database-instance-identifier}"
    db_subnet_group_name = "default-vpc-0217757ec8c0923c7"
    multi_az = No
    vpc_security_group_ids = [ aws_security_group.security_group.id ]
    storage_type = gp2
 
}