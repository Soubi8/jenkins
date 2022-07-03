provider "aws" {
  profile = var.profile
  region  = var.region
}

resource "aws_instance" "web" {
  ami                    = var.ami
  count                  = 2
  key_name               = var.key_name
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name    = "Server ${count.index + 1}"
    Owner   = var.tag_owner_name
    Project = var.tag_project_name
  }

  provisioner "local-exec" {
    command     = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${self.public_ip},' --private-key ~/.ssh/fp_key.pem ./playbook_aws/main.yml"
    interpreter = ["bash", "-c"]
  }

}

resource "aws_security_group" "web_sg" {
  name = "web_sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow default HTTP port"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow default HTTPS port"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow default SSH port"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name        = "web_sg"
    Description = "HTTP(S)/SSH-ALL"
  }
}

locals {
  cf_auth = {
    email : "${var.cloudflare_email}",
    api_key : "${var.cloudflare_api_key}",
    zone_id : "${var.cloudflare_zone_id}"
  }
}

module "dev_cloudflare" {
  source  = "./modules/cloudflare"
  name    = "dev"
  ip      = aws_instance.web.0.public_ip
  cf_auth = local.cf_auth
}

module "cloudflare" {
  source  = "./modules/cloudflare"
  name    = "@"
  ip      = aws_instance.web.1.public_ip
  cf_auth = local.cf_auth
}