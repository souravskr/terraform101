provider "aws" {
  region = "ca-central-1"
}

variable "instanceName" {
    type = string
    description = "Write your instance name"
}

variable "amiName" {
    type = string
    description = "Write your desired ami"
}

variable "instanceType" {
    type = string
    description = "Write the type of the instance"
}

resource "aws_instance" "ec2WithEIP" {
  ami = var.amiName
  instance_type = var.instanceType
  tags = {
    Name = var.instanceName
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.ec2WithEIP.id
}

output "EIP" {
    value = aws_eip.eip.public_ip
}