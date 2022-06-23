variable "region" {
  description = "AWS Region the instance is launched in"
  type        = string
  default     = "eu-central-1"
}

variable "profile" {
  description = "AWS credentials profile"
  type        = string
  default     = "terraform"
}

variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
  default     = "ami-02584c1c9d05efa69"
}

variable "instance_type" {
  description = "Hardware Type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key Pair"
  type        = string
  default     = "fp_key"
}

variable "tag_owner_name" {
  description = "Tag: Owner's Name"
  type        = string
  default     = "Maksym Obukhovskyi"
}

variable "tag_project_name" {
  description = "Tag: Project's Name"
  type        = string
  default     = "Final Project"
}

variable "cloudflare_email" {
  description = "Email address associated with Cloudflare"
  type        = string
  sensitive   = true
}

variable "cloudflare_api_key" {
  description = "Cloudflare's API key"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare's Zone ID"
  type        = string
  sensitive   = true
}