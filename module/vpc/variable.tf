variable "vpc_cidr_block" {

    default     = "10.0.0.0/16"
    description = "Private-VPC"
    type        = string
  
}

variable "public_subnet_az1_cidr" {

    default     = "10.0.0.0/24"
    description = "Public subnet az1 CIDR-Block"
    type        = string
  
}
variable "public_subnet_az2_cidr" {

    default     = "10.0.3.0/24"
    description = "Public subnet az2 CIDR-Block"
    type        = string
  
}
variable "private_subnet_az1_cidr" {

    default     = "10.0.2.0/24"
    description = "Private subnet az1 CIDR-Block"
    type        = string
  
}
variable "private_subnet_az2_cidr" {

    default     = "10.0.1.0/24"
    description = "Private subnet az2 CIDR-Block"
    type        = string
  
}