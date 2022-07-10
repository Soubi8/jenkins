### Terraform:
Create file __secret.auto.tfvars__ and add the following variables there:

    cloudflare_email = "value"
    cloudflare_api_key = "value"
    cloudflare_zone_id = "value"

Otherwise, __terraform__ will ask for the values to be entered during the plan/apply stages.