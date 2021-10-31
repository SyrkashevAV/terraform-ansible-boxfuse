pipeline {
    agent {
        dockerfile true
    }

    stages {
        stage('checkout project') {
            steps{
                sh 'rm -rf boxfuse-terraform/*'
                git 'https://github.com/Misterro/boxfuse-terraform.git'
                sh 'ls -la'
            }
        }

        stage("terraform init") {
            steps {
                sh 'cd boxfuse-terraform/terraform && terraform init'
            }
        }

        stage("terraform apply") {
            steps {
                sh 'terraform apply -var yandex_token="${YANDEX_TOKEN}" -var yandex-cloud-id="${YANDEX_CLOUD_ID}" -var yandex-folder-id=${YANDEX_FOLDER_ID} -var yandex-zone=${YANDEX_ZONE}'
            }
        }
    }
}