terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

terraform {
backend "s3" {
    bucket         = "yordanka-terraform-state-backend"
    key            = "terraform_state.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform_state"
  }
}

provider "aws" {
  region = var.aws_region
}
