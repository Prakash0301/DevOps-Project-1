terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
  }
  backend "s3" {
    bucket = "terraform-remote-backend-s3-devops"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"

  }
}

provider "aws" {
  region = "ap-south-1"
}