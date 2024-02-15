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
    resource "server_side_encryption_configuration" "encryption" {
      rule {
        apply_server_side_encryption_by_default {
        
          sse_algorithm = "AES256"
        }
      }
    }


resource "aws_s3_bucket" "access_logs" {

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

    lifecycle_rule {
      enabled = true
      prefix = ""
    
    
    transition {
      days = "90"
      storage_class = "STANDARD_IA"
    }

    expiration {
      
      days = "90"
      
    }
    }

    
    tags = {
      Name="accesslog" 
    } 
}
 data "aws_iam_policy_document" "s3_bucket_lb_write" {
  policy_id = "s3_bucket_lb_logs"

  statement {
    actions = [
      "s3:PutObject",
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.access_logs.arn}/*",
    ]

  }

  statement {
    actions = [
      "s3:PutObject"
    ]
    effect = "Allow"
    resources = ["${aws_s3_bucket.access_logs.arn}/*"]
    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }
  }


  statement {
    actions = [
      "s3:GetBucketAcl"
    ]
    effect = "Allow"
    resources = ["${aws_s3_bucket.access_logs.arn}"]

  }
}


