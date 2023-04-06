resource "random_pet" "pet" {
  keepers = {
    time = timestamp()
  }
  length = 10
  separator = "-"
}

resource "terraform_data" "main" {
  triggers_replace = random_pet.pet.id
  provisioner "local-exec" {
    command = "echo ${self.triggers_replace}"
  }
}

output "random_pet" {
  value = random_pet.pet.id
}

output "terraform_data" {
  value = terraform_data.main.id
}
