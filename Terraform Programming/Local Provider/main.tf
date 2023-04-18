locals {
  server_info = {
    "proxy_server" : {
      ami_id = "ami-${local.random_id[0]}"
      server = "Squid"
    }
    "web_server" : {
      ami_id = "ami-${local.random_id[1]}"
      server = "Cargo-Drop"
    }
  }
  random_id = [for value in random_id.ami: value.id]
}

variable "just_for_fun" {
  type = map(object({
    ami_id = string
    server_name = string
  }))
  default = {
    app_server = {
      ami_id = ""
      server_name = ""
    }
    proxy_server = {
      ami_id = ""
      server_name = ""
    }
  }
}

resource "random_id" "ami" {
  for_each = var.just_for_fun
  byte_length = 8
}

resource "local_file" "server_information" {
  for_each = local.server_info
  filename = "${path.module}/${each.value["server"]}"
  content = each.value["ami_id"]
}

data "local_file" "server_info" {
  for_each = local.server_info
  filename = "${path.cwd}/${each.value["server"]}"
  depends_on = [local_file.server_information]
}

output "local_var_server_info" {
  value = local.server_info
}

output "file_names" {
  value = [for contents in local_file.server_information: contents.filename]
}

output "file_name_and_contents" {
  value = {for file in data.local_file.server_info: file.filename => file.content}
}
