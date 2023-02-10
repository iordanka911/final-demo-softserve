variable "aws_region" {
  description = "aws region"
}

variable "aws_profile" {
  description = "aws profile"
}

#variable "remote_state_bucket" {}

variable "repo_url" {
  description = "URL to Github repository to fetch source from"
}

variable "github_oauth_token" {
  description = "Github OAuth token with repo access permissions"
}

variable "my_project_name" {
   type          =string
   description   ="Application Name"
}

variable "app_environment" {
   type         =string
   description  ="Application Environment"
}

variable "build_spec_file" {
  default = "configuration/buildspec.yml"
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "The VPC ID that CodeBuild uses"
}

variable "subnets" {
  type        = list(string)
  default     = null
  description = "The subnet IDs that include resources used by CodeBuild"
}

variable "security_groups" {
  type        = list(string)
  default     = null
  description = "The security group IDs used by CodeBuild to allow access to resources in the VPC"
}

variable "env_vars" {
  description = <<EOF
Pass env vars for codebuild project(in native for codebuild project format)
Example:
env_vars = [
      {
        "name"  = "SOME_KEY1"
        "value" = "SOME_VALUE1"
      },
      {
        "name"  = "SOME_KEY2"
        "value" = "SOME_VALUE2"
      },
    ]
EOF

  default = []
}

locals {
  codebuild_project_name = "${var.my_project_name}-${var.app_environment}"
  description = "Codebuild for ${var.my_project_name} environment ${var.app_environment}"
}

variable "branch_pattern" {}

variable "git_trigger_event" {}

variable "codebuild_inbound" {
  type = map(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  
  default = {
    "80" = {
      port        = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "codebuild_outbound" {
  type = map(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  
  default = {
    "0" = {
      port        = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "compute_type_codebuild" {
  default = "BUILD_GENERAL1_SMALL"
}

variable "build_image_codebuild" {
  default = "aws/codebuild/standard:4.0"
}

locals {
  emails = ["iordanka911@abv.bg"]
}