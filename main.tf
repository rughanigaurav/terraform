provider "aws" {
    region = "us-east-1" 
    access_key = "AKIAYS2NSI32E4NPK352"
    secret_key = "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"

}

module "vpc" {

  source                      = "../modules/vpc"
  region                      = us-east-1
  vpc_cidr                    = var.vpc_cidr_block
  public_subnet_az1_cidr      = var.public_subnet_az1
  public_subnet_az2_cidr      = var.public_subnet_az2
  private_subnet_az1_cidr     = var.private_app_subnet_az1
  private_subnet_az2_cidr     = var.private_app_subnet_az2

}

module "security_group" {

  source = "../modules/vpc"
  vpc_id = var.vpc_id

}


module "aws_s3_bucket" {

  source = "../modules/s3-bucket"
  bucket = var.bucket_name
}


