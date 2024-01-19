resource "aws_kms_key" "S3-Access" {

    key_usage = "Encrypt and decrypt"
    description = "Linx-Staging S3 Bucket key"
}
