# Variable for string
variable "vpcname" {
  type = "string"
  default = "my-vpc"
}

# Variable for integer
variable "sshport" {
  type = number
  default = 22
}

# Variable for boolean
variable "enabled" {
  default = true
}

# Variable for array
variable "mylist" {
  type = list(string)
  default = ["value1", "value2", "value3"]
}

# variable for dictionary or map
variable "mymap" {
  type = map
  default = {
      key1 = "value1"
      key2 = "value2"
  }
}
