resource "aws_instance" "testec2" {
  ami           = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  key_name = "TTStest.pem"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count = 2

  tags = {
    Name = "testec2"
  }

  provisioner "file" {
    source = "./TTStest.pem"
    destination = "/home/lenovo/Downlods/TTStest.pem"
  
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = "${file("./TTStest.pem")}"
    }  
  }
}

resource "aws_instance" "db" {
  ami           = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  key_name = "TTStest.pem"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB Server"
  }
}