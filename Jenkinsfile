pipeline {
    agent {
        dockerfile {
            args '-v /home/jenkins/.ssh/:/root/.ssh/ -u root --no-cache'
        }
    }

    stages {
        stage("terraform init") {
            steps {
                sh 'ls -la'
                sh 'terraform init'
            }
        }

        stage("terraform apply") {
            steps {
                sh 'terraform apply -var "yandex-token=${YANDEX_TOKEN}" -var "yandex-cloud-id=${YANDEX_CLOUD_ID}" -var "yandex-folder-id=${YANDEX_FOLDER_ID}" -var "yandex-zone=${YANDEX_ZONE}" -auto-approve'
            }
        }
    }
}