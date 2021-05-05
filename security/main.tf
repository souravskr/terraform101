provider "aws" {
  region = "ca-central-1"
}

resource "aws_security_group" "webTraffic" {
  name = "Allow HTTPS"
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 443
    to_port = 443
    protocol = "TCP"
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 443
    to_port = 443
    protocol = "TCP"
  } 
}

resource "aws_instance" "ec2" {
  ami = "ami-0101734ab73bd9e15"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webTraffic.name ]
  tags = {
    Name = "InstanceForWebTraffic"
  }
}


resource "aws_eip" "elasticIP" {
  instance = aws_instance.ec2.id
}

output "EIP" {
    value = aws_eip.elasticIP.public_ip
}

# output "InstanceID" {
#     value = aws_instance.ec2.id
# }