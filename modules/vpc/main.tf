resource "aws_vpc" "test-vpc" {
  
  cidr_block = var.vpc_cidr_block
  instance_tenancy = default
  enable_dns_hostnames = true
}

resource "aws_subnet" "public_subnet_az1" {

    vpc_id   =  aws_vpc.test-vpc.id
    cidr_block = var.public_subnet_az1_cidr
    availability_zone = var.availability_zone[0]
    map_public_ip_on_launch = true
  
}

resource "aws_subnet" "public_subnet_az2" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = var.public_subnet_az2_cidr
    availability_zone = var.availability_zone[1]
    map_public_ip_on_launch = true
}


resource "aws_subnet" "private_subnet_az1" {
    vpc_id = aws_vpc.test-vpc.id
    availability_zone = var.availability_zone[0]
    cidr_block = var.private_subnet_az1_cidr
    map_public_ip_on_launch = false
}


resource "aws_subnet" "private_subnet_az2" {

    vpc_id = aws_vpc.test-vpc.id
    cidr_block = var.private_subnet_az2_cidr
    availability_zone = var.availability_zone[1]
    map_public_ip_on_launch = false    
}