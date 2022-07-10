# CI/CD Pipeline
## About

The project's goal is to build a successful CI/CD pipeline using the available tools and knowledge of the author

## GitHub Repository's used for pipeline

The following repositories were forked and used in this project:

### [Solid-Realworld](https://github.com/solidjs/solid-realworld)&nbsp;&nbsp;&nbsp;&nbsp;[Realworld-Springboot-Java](https://github.com/raeperd/realworld-springboot-java)

### Terraform:
Create file __secret.auto.tfvars__ and add the following variables there:

    cloudflare_email = "value"
    cloudflare_api_key = "value"
    cloudflare_zone_id = "value"

Otherwise, __terraform__ will ask for the values to be entered during the plan/apply stages.