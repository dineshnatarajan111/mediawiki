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
                git clone "https://github.com/dineshnatarajan111/mediawiki.git" --branch main
                """
            }
        }
        stage('Get variables'){
            steps {
                sh"""
                git clone "https://github.com/dineshnatarajan111/ST-Mediawiki.git" --branch helm
                """
            }
        }
        stage('Get credentials') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'AZURE_SPN_CREDENTIALS', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    script {
                        sh """
                        az login --service-principal --username "$USERNAME" --password "$PASSWORD" --tenant 8b291cd0-45de-4938-9a8c-5dd465d71ada
                        az account list
                        az account set --subscription 712bd090-a32d-4751-8248-1d16ae47d011
                        az aks get-credentials --resource-group Az-DEV --name aks-blue-dev --overwrite-existing
                        """
                    }
                }
            }
        }
        stage('Execute HELM'){
            steps{
                script{
                    def namespace = params.NAMESPACE
                    def deploy_resource = params.DEPLOY_RESOURCES
                    def application = "mediawiki-app"
                    def database = "mediawiki-db"
                    if(deploy_resource == 'ALL'){
                        sh"""
                        helm upgrade --install $application -f ./ST-Mediawiki/$namespace/application/values.yaml ./mediawiki/application -n $namespace
                        helm upgrade --install $database -f ./ST-Mediawiki/$namespace/database/values.yaml ./mediawiki/database -n $namespace
                        """
                    }
                    else if(deploy_resource == 'APPLICATION'){
                        sh"""
                        helm upgrade --install $application -f ./ST-Mediawiki/$namespace/application/values.yaml ./mediawiki/application -n $namespace
                        """
                    }
                    else if(deploy_resource == 'DATABASE'){
                        sh"""
                        helm upgrade --install $database -f ./ST-Mediawiki/$namespace/database/values.yaml ./mediawiki/database -n $namespace
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
