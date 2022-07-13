variable "awsRegion" {
  type = string
  default = "ca-central-1"
}

variable "instanceName" {
  type        = string
  description = "Please write the instance name"
  default = "myExampleEc2Instance"
}

variable "instanceType" {
  type        = string
  description = "Write the instance type"
  default = "t2.micro"
}

variable "ec2AMIs" {
  type        = map(string)
  description = "Map of string for AMIs"
  default = {
    ca-central-1 = "ami-0101734ab73bd9e15"
  }
}

variable "myList" {
  type = list(string)
  default = ["a", "b", "c"]
}
