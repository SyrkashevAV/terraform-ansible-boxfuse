pipeline {
    agent {
        dockerfile {
            args '-v /home/jenkins/.ssh/:/root/.ssh/ -u root'
        }
    }

    stages {
        stage("terraform init") {
            steps {
                dir('terraform') {
                    sh 'rm -rf .terraform/* .terraform.lock.hcl terraform.tfstate'
                    sh 'terraform init'
                }

            }
        }

        stage("terraform apply") {
            steps {
                dir('terraform') {
                    sh 'terraform apply -var "yandex-token=${YANDEX_TOKEN}" -var "yandex-cloud-id=${YANDEX_CLOUD_ID}" -var "yandex-folder-id=${YANDEX_FOLDER_ID}" -var "yandex-zone=${YANDEX_ZONE}" -auto-approve'
                }
            }
        }
        stage("build") {
            steps {
                dir('ansible') {
                    sh 'cat ./inventory/inventory.yaml'
                    sh 'ansible all -i ./inventory/inventory.yaml -m ping -u Ubuntu'
                }
            }
        }
    }
}