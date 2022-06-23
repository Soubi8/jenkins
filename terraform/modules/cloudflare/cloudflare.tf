provider "cloudflare" {
  email   = var.cf_auth.email
  api_key = var.cf_auth.api_key
}

resource "cloudflare_record" "app" {
  zone_id = var.cf_auth.zone_id
  name    = var.name
  value   = var.ip
  type    = "A"
  proxied = true
}