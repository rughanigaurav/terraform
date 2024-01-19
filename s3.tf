resource "aws_s3_bucket" "S3" {

    bucket = "test-terraform191091"

    tags = {
      Name="s3_bucket" 
    }
  
}