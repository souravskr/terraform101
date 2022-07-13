provider "aws" {
  region = "ca-central-1"
}

resource "aws_instance" "ec2instance" {
  ami           = lookup(var.ec2AMIs, var.awsRegion)
  instance_type = var.instanceType
  tags = {
    Name = var.instanceName
  }
}

