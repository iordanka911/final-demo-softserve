variable "aws_region" {
  #default region to deploy infrastructure
  type        = string
  description ="AWS Region"
}

variable "aws_profile" {
  description = "aws profile"
}

variable "image_tag" {
    type = string
}

variable "working_dir" {
    type = string
}

variable "my_project_name" {
   type          =string
   description   ="Application Name"
}

variable "app_environment" {
   type         =string
   description  ="Application Environment"
}