pipeline {
    agent {
        dockerfile {
            args '-v /home/pilot/.ssh/:/root/.ssh/ -v /var/run/docker.sock:/var/run/docker.sock -u root'
        }
    }

    stages {
        stage("terraform init") {
            steps {
                dir('terraform') {
                    sh label: '', script: 'terraform init'
                }

            }
        }

        stage("terraform apply") {
            steps {
                dir('terraform') {
                    sh label: '', script: 'terraform apply -auto-approve'
                }
            }
        }
        stage("build") {
            steps {
                dir('ansible') {
                    sh 'ansible-galaxy collection install community.docker'
                    sh 'ansible-playbook playbook.yaml -i ./inventory/inventory.yaml -u ubuntu --extra-vars "password_docker=${DOCKER_HUB_PASSWORD}"'
                }
            }
        }
    }
}
