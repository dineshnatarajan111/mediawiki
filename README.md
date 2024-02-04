# Resource creation repository

#### This repositoru has 2 other branches:
1. helm
2. terraform

### Branch: helm
This branch contains helm chart for Application and Database to be provisioned on AKS. This has been automated through jenkins. The values.yaml file can be found on [ST-Mediawiki repository Terraform](https://github.com/dineshnatarajan111/ST-Mediawiki/tree/terraform "ST-Mediawiki") on branch helm.


### Branch: terraform
This branch contains terraform scripts to provision Azure kubernetes cluster under a resource group. The variable file can be found in [ST-Mediawiki repository HELM](https://github.com/dineshnatarajan111/ST-Mediawiki/tree/helm "ST-Mediawiki") on branch terraform.

### Jenkins Executions:

#### Jenkins job to create resources in Azure

![ENV_JENKINS][logo1]

[logo1]: https://github.com/dineshnatarajan111/mediawiki/blob/main/img/ENV_JENKINS.png "ENV_JENKINS"

#### Input params to create Enivironment

![ENV_CREATE][logo2]

[logo2]: https://github.com/dineshnatarajan111/mediawiki/blob/main/img/ENV_CREATE.png "ENV_CREATE"

#### Input params to destroy Enivironment

![ENV_DESTROY][logo3]

[logo3]: https://github.com/dineshnatarajan111/mediawiki/blob/main/img/ENV_DESTROY.png "ENV_DESTROY"

#### Jenkins job to create Application and Database in AKS

![HELM_JENKINS][logo4]

[logo4]: https://github.com/dineshnatarajan111/mediawiki/blob/main/img/HELM_JENKINS.png "HELM_JENKINS"

#### Input params to create Application and Database in AKS

![HELM_CREATE][logo5]

[logo5]: https://github.com/dineshnatarajan111/mediawiki/blob/main/img/HELM_CREATE.png "HELM_CREATE"

#### Input params to destroy Application and Database in AKS

![HELM_DESTROY][logo6]

[logo6]: https://github.com/dineshnatarajan111/mediawiki/blob/main/img/HELM_DESTROY.png "HELM_DESTROY"

### Jenkins Console outputs can be found in ./console_outputs