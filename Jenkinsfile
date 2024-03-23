pipeline {
    agent any
    tools {
        terraform 'terraform-stend'
    }

    stages {
        stage("Git Checkout") {
            steps {
                    git credentialsId: '7cc7a8a2-3d87-48f1-a056-9e03b1a0ba86', url: 'https://github.com/SyrkashevAV/terraform-ansible-boxfuse.git'
            }
        }
        stage("terraform init") {
            steps {
                dir('terraform') {
                    sh 'cp ../.terraformrc /var/lib/jenkins'
                    sh 'terraform init'
                }

            }
        }

        stage("terraform plan") {
            steps {
                dir('terraform') {
                    sh 'terraform plan'
                }

            }
        }

        stage("terraform apply") {
            steps {
                dir('terraform') {
                    sh 'terraform apply --auto-approve'
                }
            }
        }
        stage("build") {
            steps {
                dir('ansible') {
                    sh 'ansible-galaxy collection install community.docker'
                    sh 'ansible-playbook playbook.yaml -i ./inventory/inventory.yaml -u ubuntu --extra-vars "password_docker=Pilot_Jgnbvev_1966"'
                }
            }
        }
        stage("terraform destroy") {
            steps {
                dir('terraform') {
                    sh 'terraform destroy -target instance1'
                }
            }
        }
    }
}
