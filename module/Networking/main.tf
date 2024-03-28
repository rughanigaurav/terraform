provider "aws" {
  region = "us-east-1" #Linx deploy in North Virgenia
  
}


resource "aws_instance" "jump-server" {

    ami = "ami-0fc5d935ebf8bc3bc"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.security_group]
    key_name = "test.pem"
    subnet_id = aws_subnet.public_subnet_az1
  
  tags = {
    Name = "jump-server"
  }
}
resource "aws_instance" "Frontend-S1" {

    ami = "ami-0fc5d935ebf8bc3bc"
    instance_type = "t2.micro"
    security_groups = aws_security_group.security_group
    key_name = "test.pem"
    subnet_id = aws_subnet.private_app_subnet_az1 
  tags = {
    Name = "Frontend-S1"
  }
}


resource "aws_instance" "Backend-S1" {

    ami = "ami-0fc5d935ebf8bc3bc"
    instance_type = "t2.micro"
    security_groups = aws_security_group.security_group
    key_name = "test.pem"
    subnet_id = aws_subnet.private_app_subnet_az1
  tags = {
    Name = "Backend-S1"
  }
}
