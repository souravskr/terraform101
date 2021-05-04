provider "aws" {
  region = "ca-central-1"
}

variable "ami" {
    type = string
    description = "Fill the ami for your instance"
}

variable "instanceType" {
  type = string
  description = "Write the instance type"
}

resource "aws_instance" "ec2instance" {
  ami = var.ami
  instance_type = var.instanceType
}