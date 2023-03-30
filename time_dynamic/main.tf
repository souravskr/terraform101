locals {
  errors = {
    "error1": {
      status_codes = [201, 204]
      err_msg = "Status code invalid"
    }
    "error2": {
      status_codes = [400, 401]
      err_msg = "Client Induced Error"
    }
    "error3": {
      status_codes = [500, 503]
      err_msg = "Server Induced Error"
    }
  }
  ip_addresses = {
    "zone1" : {
      ip = "192.168.0.1"
      zone_name = "example.com."
    }
    "zone2" : {
      ip = "192.168.0.2"
      zone_name = "example2.com."
    }
    "zone3" : {
      ip = "192.168.0.3"
      zone_name = "example3.com."
    }
  }


}

#resource "dns_a_record_set" "www" {
#  for_each = local.ip_addresses
#  addresses = [each.value["ip"]]
#  zone      = each.value["zone_name"]
#}

output "regex" {
  value = length(regexall("^research-prod", "research_prod"))
}
