pipeline {
    agent{
        docker {
            image 'dinesh1705/jenkins-agent:1.1.0'
            args "--user root --privileged"
        }
    }

    environment {
        ARM_SUBSCRIPTION_ID = "712bd090-a32d-4751-8248-1d16ae47d011"
        ARM_TENANT_ID = "8b291cd0-45de-4938-9a8c-5dd465d71ada"
    }

    stages {
        stage('Get variables'){
            steps {
                sh"""
                git clone "https://github.com/dineshnatarajan111/ST-Mediawiki.git" --branch terraform
                """
            }
        }
        stage('Resource Operation'){
            steps{
                withCredentials([
                    usernamePassword(credentialsId: 'AZURE_SPN_CREDENTIALS', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD'),
                    usernamePassword(credentialsId: 'ARM_SECRET', usernameVariable: 'ARM_CLIENT_ID', passwordVariable: 'ARM_CLIENT_SECRET'),
                    string(credentialsId: 'az_storage_account_terraform', variable: 'ARM_ACCESS_KEY')
                    ]) {
                    script{
                        def namespace = params.NAMESPACE
                        def dryrun = params.DRY_RUN
                        def operation = params.OPERATION

                        def TEXT='key = ""'
                        def U_TEXT='key = "'+ namespace +'.tfstate"'
                        sh"""
                        ls -lrt
                        az login --service-principal --username "$USERNAME" --password "$PASSWORD" --tenant $ARM_TENANT_ID
                        az account list
                        az account set --subscription $ARM_SUBSCRIPTION_ID

                        sed -i 's/$TEXT/$U_TEXT/' ./providers.tf

                        terraform init -reconfigure
                        terraform workspace select $namespace || terraform workspace new $namespace
                        if [ "$dryrun" == "YES" ]; then
                        terraform plan -var-file ./ST-Mediawiki/$namespace/${namespace}.tfvars
                        elif [ "$operation" != "DESTROY" ]; then
                        terraform apply -var-file ./ST-Mediawiki/$namespace/${namespace}.tfvars -auto-approve
                        elif [ "$operation" == "DESTROY" ]; then
                        terraform destroy -var-file ./ST-Mediawiki/$namespace/${namespace}.tfvars -auto-approve
                        fi
                        """
                    }
                }
            }
        }
    }
    post {
        always {
            // Clean the workspace after every build
            cleanWs()
        }
    }
}
