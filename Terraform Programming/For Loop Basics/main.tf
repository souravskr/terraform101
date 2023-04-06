variable "alp_list" {
  default = ["a", "b", "c", "c"]
  type    = list(string)
}

locals {
  alp_obj_cap = {
    for k, v in var.alp_list: k => upper(v)
  }
  alp_obj_condition = [
    for k, v in local.alp_obj_cap: k
          if v == "C"
]
  alp_set = toset([for k in local.alp_obj_cap: lower(k)])
}

output "alp_cap" {
  value = local.alp_obj_cap
}

output "alp_condition" {
  value = local.alp_obj_condition
}

output "alp_list_toset" {
  value = local.alp_set
}


