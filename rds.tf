
resource "aws_db_instance" "db-instance" {
    
    instance_class = "${var.databae-instance-class}"
    availability_zone = "us-east-1b"
    identifier = "${var.database-instance-identifier}"
    db_subnet_group_name = aws_db_subnet_group.db-subnet-group
    multi_az = false
    vpc_security_group_ids = [ aws_security_group.security_group.id ]
    username = "Pr0l1x_Admin"
    password = "2tVkHZ4cYaUo66DLRinM"
    allocated_storage = 20
    storage_type = "gp2"
    engine = "postgres"
    engine_version = 15.5
    performance_insights_enabled = false
    port = 3306
    publicly_accessible = true
}