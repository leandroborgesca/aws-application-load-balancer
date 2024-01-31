terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.26.0"
    }
  }
  backend "s3" {
    bucket = "terraform-backend-qc"
    key    = "terraform-alb.tfstate"
    region = "ca-central-1"
  }
}

provider "aws" {
  region = "ca-central-1"
}


