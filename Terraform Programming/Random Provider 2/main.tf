variable "instance_count" {
  default = 3
}

resource "random_pet" "instance_names" {
  count = var.instance_count
}

resource "random_id" "instance_ids" {
  count = var.instance_count
  byte_length = 0
}

output "random_ids" {
  value = {for id in random_id.instance_ids: id => {}}
}
