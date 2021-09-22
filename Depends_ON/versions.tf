terraform {
  required_version = "~>0.14.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.0.0"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
  profile = "default"
}