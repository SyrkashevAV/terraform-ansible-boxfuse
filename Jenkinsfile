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
                    sh "pwd"
                    sh 'rm -rf .terraform/* .terraform.lock.hcl terraform.tfstate'
                    sh 'terraform init'
                    sh 'pwd && ls -la'
                }

            }
        }

        stage("terraform apply") {
            steps {
                dir('terraform') {
                    sh 'pwd'
                    sh 'ls -la && pwd'
                    sh 'terraform apply -var "yandex-token=${YANDEX_TOKEN}" -var "yandex-cloud-id=${YANDEX_CLOUD_ID}" -var "yandex-folder-id=${YANDEX_FOLDER_ID}" -var "yandex-zone=${YANDEX_ZONE}" -auto-approve -chdir terraform/'
                }
            }
        }
        stage("ansible") {
            steps {
                sh 'cat ansible/inventory.yaml'
            }
        }
    }
}