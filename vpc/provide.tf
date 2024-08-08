terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "devcloudgeek-terragrunt"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    profile        = "aws"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "aws"
  default_tags {
    tags = {
      createdBy = "Vivek Gupta"
      ManagedBy = "Terraform"
      Version   = "1.0.1"
    }
  }
}