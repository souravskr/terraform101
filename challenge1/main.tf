provider "aws" {
  region = "ca-central-1"
}

variable "vpcname" {
  type = string
  default = "TerraformVPC"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name = var.vpcname
  }
}

