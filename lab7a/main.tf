

provider "aws" {
  region  = "us-east-1"    # Specify your AWS region
  profile = "default"      # Optional: Use this if you're using a specific AWS profile from ~/.aws/credentials
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Make sure this matches the version you have installed
    }
  }

  backend "s3" {
    bucket         = "terraform-state-bhanu1"
    key            = "terraform/state"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-00a929b66ed6e0de6"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Test-Instance"
  }
}

