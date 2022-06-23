variable "cf_auth" {
  type = object({
    email : string,
    api_key : string,
    zone_id : string
  })
}

variable "name" {
  type = string
}

variable "ip" {
  type = string
}