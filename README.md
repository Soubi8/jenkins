# CI/CD Pipeline
## About

The project's goal is to build a successful CI/CD pipeline using the available tools and knowledge of the author

## GitHub Repository's used for pipeline

The following repositories were forked and used in this project:

### [Solid-Realworld](https://github.com/solidjs/solid-realworld)&nbsp;&nbsp;&nbsp;&nbsp;[Realworld-Springboot-Java](https://github.com/raeperd/realworld-springboot-java)

## Getting started

## Environment provisioning

Terraform is expecting the credentials from a _profile_ variable, which is currently set to _terraform_ in [terraform/variables.tf](terraform/variables.tf). It is required for the terraform to connect to the AWS. More on the credentials for AWS [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-config).

    terraform init      # To load the modules
    terraform plan      # To view the planned provisioning (optional)
    terraform apply     # To provision the infrastructure

Terraform provisions two AWS EC2 instances, applies a security group to allow inbound SSH, HTTP and HTTPS access, as well as outbound communication. Variables can be viewed and edited in [terraform/variables.tf](terraform/variables.tf) file. 

In addition it creates two DNS A records for domain _epam.pp.ua_ in Cloudflare, more on this in the next section (_optional_).

### Cloudflare module (optional):

Create a file __secret.auto.tfvars__ and add the following variables there:

    cloudflare_email   = "value"
    cloudflare_api_key = "value"
    cloudflare_zone_id = "value"

Otherwise, __terraform__ will ask for the values to be entered during the plan/apply stages.

If there is no domain name available, the _Cloudflare_ module should be commented with _#_ in [main.tf](terraform/main.tf).
