variable "cloudflare_email" {
    description = "Email address associated with Cloudflare"
    type = string
    sensitive = true
}

variable "cloudflare_api_key" {
    description = "Cloudflare's API key"
    type = string
    sensitive = true
}


variable "cloudflare_zone_id" {
    description = "Cloudflare's Zone ID"
    type = string
    sensitive = true
}