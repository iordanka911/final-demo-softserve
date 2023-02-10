variable "aws_region" {
  #default region to deploy infrastructure
  type        = string
  description ="AWS Region"
}

variable "aws_cloudwatch_retention_in_days" {
  type        = number
  description = "AWS CloudWatch Logs Retention in Days"
  default     = 1
}

variable "my_project_name" {
   type          =string
   description   ="Application Name"
}

variable "app_environment" {
   type         =string
   description  ="Application Environment"
}

variable "cidr" {
    description ="The CIDR block for the VPC."
    default="10.0.0.0/16"
}

variable "private_subnets" {
   description= "List of private subnets"
}

variable "public_subnets" {
    description ="List of public subnets"
}

variable "availability_zones" {
   description   = "List of availability zones"
}
