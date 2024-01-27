resource "aws_s3_bucket" "Linx-s3" {

    bucket = "test-terraform191091"
    acl = "public-read"

    versioning {
      
      enabled = false
    }
    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
       
          sse_algorithm = "AES256"
        }
      }
    }
    tags = {
      Name="s3_bucket" 
    } 
}