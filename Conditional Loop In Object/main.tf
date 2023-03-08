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
}

output "only_alphabets" {
  value = flatten([
    for k, v in local.alphabets:
          [for i, j in v: j]
  ])
}
