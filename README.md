Terraform:
Create file _secret.auto.tfvars_ and add the following variables there:
cloudflare_email = "value"
cloudflare_api_key = "value"
cloudflare_zone_id = "value"
Otherwise, terraform will ask for the values to be entered during the plan/apply stages.