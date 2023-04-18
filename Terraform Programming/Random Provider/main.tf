locals {
  random_strings = ["string1", "string2", "string3"]
}

resource "random_string" "random" {
  for_each = toset(local.random_strings)

  length = 10
}

output "random_strings" {
  value = {for str_name, rand_str in random_string.random: str_name => rand_str.id}
}
