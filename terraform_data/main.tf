/*
  - This module creates locals files according to the local variable server_info. The server_info is a map of object.
  - This module create locals file where file names are "server_name".
  - This module creates locals files where contents are "ami_id".
*/

locals {
  server_info = {
    "squid": {
      ami_id = "ami-0101734ab73bd9e15"
      server_name = "Squid"
    }
    "webserver": {
      ami_id = "ami-aWp6QRchles"
      server_name = "webserver"
    }
  }
}

/*
  - Loop through the local variable "server_info" and assign file name by each.value["server_name"] & content by
   each.value["ami_id"].
  - Since this is a map of object, each.value will give us objects like:
    {
      ami_id = "ami-0101734ab73bd9e15"
      server_name = "Squid"
    }
  - And each.value["server_name"] will be "Squid", which is a file name.
  - And each.value["ami_id"] will be "ami-0101734ab73bd9e15", which is the content of the file "Squid".
*/

resource "local_file" "server_information" {
  for_each = local.server_info
  filename = "${path.module}/${ each.value["server_name"] }"
  content = each.value["ami_id"]
}

data "local_file" "server_information" {
  for_each = local.server_info
  filename = "${path.module}/${each.value["server_name"]}"
  depends_on = [local_file.server_information]
}

output "file_contents" {
  value = {for file in data.local_file.server_information: file.filename => file.content}
}
