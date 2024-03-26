pipeline {
    options { timestamps() }
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
        stage("Terraform init") {
            steps {
                dir('terraform') {
                    sh 'cp ../.terraformrc /var/lib/jenkins'
                    sh 'terraform init'
                }

            }
        }

        stage("Terraform plan") {
            steps {
                dir('terraform') {
                    sh 'terraform plan'
                }

            }
        }

        stage("Terraform apply") {
            steps {
                dir('terraform') {
                    sh 'terraform apply --auto-approve'
                }
            }
        }
        stage("Build on ansible") {
            steps {
                dir('ansible') {
                    sh 'ansible-galaxy collection install community.docker'
                    sh 'ansible-playbook playbook.yaml -i ./inventory.yaml -u ubuntu --extra-vars "docker_hub_password=@main.yml"'
                }
            }
        }
        stage("Terraform destroy") {
            steps {
                dir('terraform') {
                    sh 'terraform destroy -target yandex_compute_instance.build[0] -auto-approve'
                }
            }
        }
    }
}
