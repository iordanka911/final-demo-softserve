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


variable "s3-demo-bucket" {
  type        = string
  description = "S3 Bucket name"
  default     = "eu-central-bucket-1"
}


variable "aws_profile" {
  default = "Yordanka Jekova"
}

variable "aws_account" {
  type    = string
  default = "147567588314"
}


variable "name_container" {
  default = "app-project-catsapp"
}

# variable "web_server_image" {
#   default = "147567588314.dkr.ecr.eu-central-1.amazonaws.com/app-project-catsapp"
# }

variable "image_tag" {
  type    = string
  default = "0.0.1"
}


variable "github_oauth_token" {
  type    = string
  default = ""
}

variable "repo_url" {
  type    = string
  default = "https://github.com/iordanka911/final-demo-2023"
}

variable "branch_pattern" {
  type    = string
  default = "main"
}

variable "git_trigger_event" {
  type    = string
  default = "PUSH"
}

variable "app_count" {
  default = 1
}