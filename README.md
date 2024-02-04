# Resource creation repository

#### This repositoru has 2 other branches:
1. helm
2. terraform

### Branch: helm
This branch contains helm chart for Application and Database to be provisioned on AKS. This has been automated through jenkins. The values.yaml file can be found on [ST-Mediawiki repository Terraform](https://github.com/dineshnatarajan111/ST-Mediawiki/tree/terraform "ST-Mediawiki") on branch helm.


### Branch: terraform
This branch contains terraform scripts to provision Azure kubernetes cluster under a resource group. The variable file can be found in [ST-Mediawiki repository HELM](https://github.com/dineshnatarajan111/ST-Mediawiki/tree/helm "ST-Mediawiki") on branch terraform.