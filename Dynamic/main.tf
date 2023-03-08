variable "alp_list" {
  default = ["a", "b", "c"]
  type    = list(string)
}

locals {
  alp_obj_small = {for i in var.alp_list: i => i}
  alp_obj_cap = {
    for i, v in local.alp_obj_small: i => upper(v)
          if v == "b"
  }
}

output "alp_cap" {
  value = local.alp_obj_cap
}


