pipeline {
    agent {
        dockerfile {
            args '-v /home/jenkins/.ssh/:/root/.ssh/ -u root'
        }
    }

    stages {
        stage("terraform init") {
            steps {
                sh 'rm -rf .terraform/* .terraform.lock.hcl terraform.tfstate'
                sh 'terraform init'
            }
        }

        stage("terraform apply") {
            steps {
                sh 'terraform apply -var "yandex-token=${YANDEX_TOKEN}" -var "yandex-cloud-id=${YANDEX_CLOUD_ID}" -var "yandex-folder-id=${YANDEX_FOLDER_ID}" -var "yandex-zone=${YANDEX_ZONE}" -auto-approve'
            }
        }
        stage("terraform apply") {
            steps {
                sh 'ansible -i inventory/inventory.yaml ping'
            }
        }
    }
}