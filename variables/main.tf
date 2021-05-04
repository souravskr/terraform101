# Todo: declare the cloud provider
provider "aws" {
  region = "ca-central-1"
}


# Todo: Variable for string
variable "vpcname" {
  type = "string"
  default = "my-vpc"
}

# Todo: Variable for integer
variable "sshport" {
  type = number
  default = 22
}

# Todo: Variable for boolean
variable "enabled" {
  default = true
}

# Todo: Variable for array
variable "mylist" {
  type = list(string)
  default = ["my-vpc-1", "my-vpc-2", "my-vpc-3"]
}

# Todo: variable for dictionary or map
variable "mymap" {
  type = map
  default = {
      key1 = "my-vpc-1"
      key2 = "my-vpc-2"
  }
}

# Todo: use the string variable "vpcname" to name a vpc while creation
resource "aws_vpc" "mypvc" {
  cidr_block = "10.0.0.0/16" 
  tags = {
    name = var.vpcname
  }
}

# Todo: use tupple variable
variable mytuple {
  type        = tuple([string, number, string])
  default     = ["vpc-1", 12785, "vpc-2"]
  # description = "tupel"
}

# Todo: use object variable
variable myobject {
  type        = object({
    name = string,
    port = list(number)
  })
  default     = {
    name = "vpc-1"
    port = [22, 25, 80]
  }
}



# Todo: use the list variable "mylist" to name a vpc while creation
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
      name = var.mylist[0]
  }
}

# Todo: use the map variable "mymap" to name a vpc while creation
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
      name = var.mymap["key1"]
  }
}