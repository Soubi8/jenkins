provider "cloudflare" {
  email = var.cf_email
  api_key = var.cf_api_key
}

variable "ip_dev" {
}

variable "ip_prod"{
}

resource "cloudflare_record" "www" {
  domain = "epam.pp.ua"
  name = "www"
  value = var.aws_instance.web.1.public_ip
  type = "A"
  proxied = true
}

resource "cloudflare_record" "dev" {
  domain = "epam.pp.ua"
  name = "dev"
  value = var.aws_instance.web.0.public_ip
  type = "A"
  proxied = true
}
