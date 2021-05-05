provider "aws" {
  region = "ca-central-1"
}

variable "ingressPorts" {
    type = list(number)
    default = [443, 80, 22]
}

variable "egressPorts" {
    type = list(number)
    default = [443, 80, 8080, 22, 25]
}

resource "aws_security_group" "demoSG" {
  name = "Allow HTTPS"
  dynamic "ingress" {
      iterator = port
      for_each = var.ingressPorts
      content {
          cidr_blocks = ["0.0.0.0/0"]
          from_port = port.value
          to_port = port.value
          protocol = "TCP"
      }
  }

  dynamic "egress" {
      iterator = port
      for_each = var.egressPorts
      content {
          cidr_blocks = ["0.0.0.0/0"]
          from_port = port.value
          to_port = port.value
          protocol = "TCP"
      }
  }
}


resource "aws_instance" "ec2" {
  ami = "ami-0101734ab73bd9e15"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.demoSG.name ]
  tags = {
    Name = "InstanceWithDynamicBlocks"
  }
}