resource "aws_kms_key" "S3-Access" {

    key_usage = "ENCRYPT_DECRYPT"
    description = "Linx-Staging S3 Bucket key"
}


