provider "aws" {
  region = "ca-central-1"
}


variable "instanceName" {
  type = string
  description = "Please write the instance name"
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
  tags = {
    Name = var.instanceName
  }
}

output "instanceID" {
    value = aws_instance.ec2instance.id
}