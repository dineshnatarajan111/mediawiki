pipeline {
    agent{
        docker {
            image 'dinesh1705/jenkins-agent:1.1.0'
            args "--user root --privileged"
        }
    }

    stages {
        stage('Clone Repository') {
            steps {
                sh"""
                git clone "https://github.com/dineshnatarajan111/mediawiki.git" --branch terraform
                """
            }
        }
        stage('Get variables'){
            steps {
                sh"""
                git clone "https://github.com/dineshnatarajan111/ST-Mediawiki.git" --branch terraform
                """
            }
        }
        stage('Get credentials') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'AZURE_SPN_CREDENTIALS', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    script {
                        def namespace = params.NAMESPACE
                        sh """
                        az login --service-principal --username "$USERNAME" --password "$PASSWORD" --tenant 8b291cd0-45de-4938-9a8c-5dd465d71ada
                        az account list
                        az account set --subscription 712bd090-a32d-4751-8248-1d16ae47d011
                        az aks get-credentials --resource-group Az-dev --name aks-blue-dev --overwrite-existing
                        """
                    }
                }
            }
        }
        stage('Resource Operation'){
            steps{
                script{
                    def namespace = params.NAMESPACE
                    def dryrun = params.DRY_RUN
                    def operation = params.OPERATION

                    def TEXT='key = ""'
                    def U_TEXT='key = "'+ namespace +'.tfstate"'
                    sh"""
                    cd ./mediawiki
                    sed -i 's/$TEXT/$U_TEXT/' ./providers.tf

                    terraform workspace select $namespace || terrafrom workspace new $namespace
                    terraform init -reconfigure
                    if [ "$dryrun" == "YES" ]; then
                    terraform plan -var-file ../ST-Mediawiki/$namespace/values.yaml
                    fi
                    if [ "$operation" != "DESTROY" ]; then
                    terraform apply -var-file ../ST-Mediawiki/$namespace/values.yaml -auto-approve
                    elif [ "$operation" == "DESTROY" ]; then
                    terraform destroy -var-file ../ST-Mediawiki/$namespace/values.yaml -auto-approve
                    fi
                    """
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
