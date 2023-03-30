locals {
  target_groups = {
    target1 = {
      name = "example1"
      trigger = {
        cluster_instance_ids = [for rand_string in random_string.random_strings : rand_string.id][0]
      }
      connection = {
        host = [for pet_name in random_pet.pet_names : pet_name.id][0]
      }
    }
    target2 = {
      name = "example2"
      trigger = {
        cluster_instance_ids = [for rand_string in random_string.random_strings : rand_string.id][1]
      }
      connection = {
        host = [for pet_name in random_pet.pet_names : pet_name.id][1]
      }
    }
  }
}

resource "random_string" "random_strings" {
  count  = 2
  length = 10
}

resource "random_pet" "pet_names" {
  count  = 2
  length = 10
}

resource "null_resource" "demo_resource" {
  for_each = local.target_groups

  triggers = each.value.trigger
  connection {
    host = each.value.connection.host
  }
}

locals {
  null_resource_triggers = [for k, v in null_resource.demo_resource : v.triggers
    if k == "target1"
  ]
}

output "null_resource_triggers" {
  value = local.null_resource_triggers
}
