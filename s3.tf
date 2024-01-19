resource "aws_s3_bucket" "Linx-s3" {

    bucket = "test-terraform191091"
    acl = "public-read"

    versioning {
      
      enabled = false
    }

    tags = {
      Name="s3_bucket" 
    }
  
}