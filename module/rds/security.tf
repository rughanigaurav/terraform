resource "aws_security_group" "security_group" {
  name        = "RDS-SG"
  description = "Apply security to access RDS"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description      = "http access"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    cidr_blocks      = ["103.105.233.106/32","74.103.179.108/32"]
  }
}