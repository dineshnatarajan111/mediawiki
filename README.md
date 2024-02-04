# TERRAFORM TO CREATE AKS
Main aim is to create AKS in Azure using terraform script and automate it using jenkins

### Prerequisite
1. Install terraform to execute terraform scripts in local
   ```bash
   brew install terraform
   ```
2. Install Azure cli to get the credential for terraform execution
   ```bash
   brew update && brew install azure-cli
   ```

### Create resources using terrafrom
1. Login using az-cli to get the tenant-id, subcription-id, and user-id
   ```bash
   az login
   ```
2. To ensure login
   ```bash
   az account list
   ```
3. To execute terraform script clone the repo with branch set to terraform
   ```bash
   git clone https://github.com/dineshnatarajan111/mediawiki.git --branch terraform
   ```
4. change directory to mediawiki and execute terraform init
   ```bash
   cd mediawiki
   terrafrom init -reconfigure
   ```
5. Do a terraform plan to verify the resource to be created
   ```bash
   terraform plan -var-file ./inputs/dev.tfvars -out dev.tfplan
   ```
6. After verification of plan do apply to create resource in cloud
   ```bash
   terraform apply "dev.tfplan"
   ```
7. To destroy the resource created using terrafrom
   ```bash
   terraform destroy -var-file ./inputs/dev.tfvars
   ```
### Integrating Jenkins to create resources
