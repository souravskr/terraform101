locals {
  alphabets = {
    "first" : {
      firstAlphabets : [
        "a",
        "b",
        "c"
      ]
    }
    "second" : {
      secondAlphabets : [
        "d",
        "e",
        "f"
      ]
    }
  }
  all_alphabets = flatten([
    for k, v in local.alphabets :
    [
      for i, j in v : j
    ]
  ])
}

output "all_alphabets" {
  value = local.all_alphabets
}

output "only_consonants" {
  value = [for value in local.all_alphabets : value
    if value != "e"
  ]
}

output "only_vowel" {
  value = [for value in local.all_alphabets : value
    if value == "e"
  ]
}
