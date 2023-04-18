variable "alphabets" {
  type = map(object({
    alphabet_list = list(string)
  }))
  default = {
    first = {
      alphabet_list = ["a", "b", "c"]
    }
    second = {
      alphabet_list = ["d", "e", "f"]
    }
    third = {
      alphabet_list = ["g", "h", "i"]
    }
  }
}

locals {
  all_alphabets = flatten([
    for alphabet_list in var.alphabets :
    [
      for alphabet in alphabet_list : alphabet
    ]
  ])
}

output "total_alphabets" {
  value = local.all_alphabets
}

output "vowels" {
  value = [
    for alphabet in local.all_alphabets: alphabet
          if alphabet == "e" || alphabet == "i"
  ]
}

output "consonants" {
  value = [
    for alphabet in local.all_alphabets: alphabet
          if alphabet != "e" && alphabet != "i"
  ]
}
