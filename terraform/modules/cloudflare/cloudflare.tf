provider "cloudflare" {
  email = var.cf_auth.email
  api_key = var.cf_auth.api_key
  zone_id = var.cf_auth.zone_id
}

variable "cf_auth" {
}

variable "name" {
}

variable "ip"{
}

resource "cloudflare_record" "app" {
  name = var.name
  value = var.ip
  type = "A"
  proxied = true
}