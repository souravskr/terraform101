terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.0"
    }
  }
}

variable "region" {
  default = ""
}
provider "aws" {
  region = var.region
}

// initialize provider in "MWS" mode to provision new workspace
variable "databricks_account_username" {
  default = ""
}
variable "databricks_account_password" {
  default = ""
}
provider "databricks" {
  host     = "https://accounts.cloud.databricks.com"
  username = var.databricks_account_username
  password = var.databricks_account_password
}
