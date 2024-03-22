pipeline {
    agent {
        dockerfile {
            args '-v /home/pilot/.ssh/:/root/.ssh/ -v /var/run/docker.sock:/var/run/docker.sock -u root'
        }
    }

    tools {
        terraform 'terraform-stend'
    }

    stages {
        stage("Git Checkout") {
            steps {
                    git credentialsId: '9c4b5e11-3c12-4d86-838a-8ad3a9f4e976', url: 'https://github.com/SyrkashevAV/terraform-ansible-boxfuse.git'
            }
        }
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
                    sh label: '', script: 'terraform apply --auto-approve'
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
