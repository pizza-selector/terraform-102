terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket       = "env-variable"
    key          = "terraform/state.tf"
    region       = "us-east-1"
    use_lockfile = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t2.micro" // free tier eligible

  tags = {
    Name        = "HelloWorld - ${var.environment}"
    Environment = var.environment
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to ami, because after the instance is created it
      # will have a proper ami assigned, like "ami-0f88e80871fd81e91"
      ami,
    ]
  }
}