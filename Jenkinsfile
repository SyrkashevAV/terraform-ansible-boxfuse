pipeline {
    agent {
        dockerfile true
    }

    stages {
        stage("terraform init") {
            steps {
                sh 'cd terraform'
                sh 'terraform init'
            }
        }

        stage("terraform plan") {
            steps {
                sh 'ls -la'
                sh 'terraform plan'
            }
        }

        stage("terraform apply") {
            steps {
                sh 'terraform apply -var="yandex-token=${YANDEX_TOKEN}" -var="yandex-cloud-id=${YANDEX_CLOUD_ID}" -var="yandex-folder-id=${YANDEX_FOLDER_ID}" -var="yandex-zone=${YANDEX_ZONE}" -auto-approve'
            }
        }
    }
}