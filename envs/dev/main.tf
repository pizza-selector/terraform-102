terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket       = "terraform-105"
    key          = "dev/state.tf"
    region       = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "app" {
  source = "../../modules/app"

  environment     = "dev"
  app_name        = "Hello world - dev"
  instance_type   = "t2.micro" // free tier eligible
}