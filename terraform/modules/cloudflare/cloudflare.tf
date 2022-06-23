provider "cloudflare" {
  email = var.cf_email
  api_key = var.cf_api_key
}

variable "name" {
}

variable "ip"{
}

resource "cloudflare_record" "app" {
  domain = "epam.pp.ua"
  name = var.name
  value = var.ip_prod
  type = "A"
  proxied = true
}