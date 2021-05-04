# Todo: Declare the provider
provider "aws" {
  region = "ca-central-1"
}

# Todo: Take user input
variable "vpcname" {
  type = string
  description = "Please type the vpcname: "
}

# Todo: create resource (vpc)
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/26"
  tags = {
    Name = var.vpcname
  }
}

# Todo: to print out the vpc id
output "vpcid" {
  value       = aws_vpc.myvpc.id
}
