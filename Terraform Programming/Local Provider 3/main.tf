
variable "key_value_pairs" {
  type = map(string)
  default = {
    "name"  = "John Doe"
    "email" = "johndoe@example.com"
    "phone" = "+1-555-555-5555"
  }
}

locals {
  flattened_key_value_pairs = {
    for key, value in var.key_value_pairs :
    upper(key) => value
  }
}

resource "local_file" "config" {
  for_each = { for key, value in var.key_value_pairs: key => upper(value)}

  content = each.value
  filename = each.key
}

output "file_info" {
  value = {for file in local_file.config: file.filename => file.content}
}

output "key_value" {
  value = local.flattened_key_value_pairs
}

output "key_value_var" {
  value = var.key_value_pairs
}
