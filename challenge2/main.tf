provider "aws" {
  region = "ca-central-1"
}

# Todo: Task 1 --> Create a DB server and output the private ip
resource "aws_instance" "dbserver" {
  ami = "ami-0101734ab73bd9e15"
  instance_type = "t2.micro"
  tags = {
    Name = "DB-Server"
  }
}

output "db-ip" {
    value = aws_instance.dbserver.private_ip
}

# Todo: Task 2 --> 1. Create a Web server and ensure it has a fixed public ip
# Todo: Task 2 --> 2. Create a Security Group for the web server with ports 80 & 443
# Todo: Task 3 --> 3. Run a script on web server

variable "allowedPorts" {
    type = list(number)
    default = [80, 443]
}

resource "aws_security_group" "sgWebServer" {
  name = "Allow HTTPS"

  dynamic "ingress" {
      iterator = port
      for_each = var.allowedPorts
      content {
          from_port = port.value
          to_port = port.value
          cidr_blocks = ["0.0.0.0/0"]
          protocol = "TCP"
      }
  }
  dynamic "egress" {
      iterator = port
      for_each = var.allowedPorts
      content {
          from_port = port.value
          to_port = port.value
          cidr_blocks = ["0.0.0.0/0"]
          protocol = "TCP"
      }
  }
}

resource "aws_instance" "webserver" {
  ami = "ami-0101734ab73bd9e15"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.sgWebServer.name ]
  user_data = file("server-script.sh")

  tags = {
    Name = "Web-Server"
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.webserver.id
}

output "web-ip" {
    value = aws_instance.webserver.public_ip
}
