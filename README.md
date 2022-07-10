# Final Project - CI/CD Pipeline
## Objectives

The project's goal is to build a successful CI/CD pipeline using the available tools and knowledge of the author. Please refer to the [presentation file](CI_CD_Pipeline_Final_Project.pptx) for the overwiew.

## GitHub repositories used for the project

The following repositories were forked and used in this project.

### [Solid-Realworld](https://github.com/solidjs/solid-realworld)&nbsp;&nbsp;&nbsp;&nbsp;[Realworld-Springboot-Java](https://github.com/raeperd/realworld-springboot-java)

## Getting started

### Containerized Jenkins Master and Agent

Ansible's [playbook](playbooks/init.yml) installs and configures all the necessary dependencies to run both Jenkins Master and Agent containerized. Most of the tasks were automated, however Jenkins setup has to be done through GUI. 

    docker compose up -d    # Starts the Jenkins Master, Agent and network

Jenkins is configured with the default offered plugins. Credentials are stored in the built-in Credentials store. 

### Provisioning the Dev and Prod environments

Terraform is expecting the credentials from a _profile_ variable, which is currently set to _terraform_ in [variables.tf](terraform/variables.tf). It is required for the terraform to connect to the AWS. More on the credentials for AWS [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-config).

    terraform init      # To load the modules
    terraform plan      # To view the planned provisioning (optional)
    terraform apply     # To provision the infrastructure

Terraform provisions two AWS EC2 instances, applies a security group to allow inbound SSH, HTTP and HTTPS access, as well as outbound communication. Provisioner runs Ansible to setup the EC2 instances according to the [playbook](terraform/playbook_aws/main.yml). It installs and configures nginx, docker and other dependencies to run the applications.

In addition, terraform creates two DNS A records for domain in Cloudflare, more on this in the next section.

### Cloudflare module (optional)

Create a file __secret.auto.tfvars__ and add the following variables there

    cloudflare_email   = "value"
    cloudflare_api_key = "value"
    cloudflare_zone_id = "value"

Otherwise, __terraform__ will ask for the values to be entered during the plan/apply stages.

If there is no domain name available, the _Cloudflare_ module should be commented with _#_ in [main.tf](terraform/main.tf).

### Multibranch pipelines

Jenkins gets events from Github's webhook and starts to build the multibranch pipelines if the Jenkinsfile is present within the application's repository. For this, files from [api](api/) folder should be added to the _develop_ branch of forked repository [Solid-Realworld](https://github.com/solidjs/solid-realworld). In turn, the content of [front](front/) folder should be added to the _feature_ branch of forked repository [Realworld-Springboot-Java](https://github.com/raeperd/realworld-springboot-java). 

Note: _Jenkins multibranch pipeline scans all branches from repository, however it processes only those, that have a Jenkinsfile present_

### Environment variables

Currently there are two environmental variables set within the Jenkins's GUI, which are used in the pipelines.

 - IP_DEV
 - IP_PROD

Values for those should be changed, based on the IP addresses provided by terraform output during the provisioning of the Dev and Prod environments.