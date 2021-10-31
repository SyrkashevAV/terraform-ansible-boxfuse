pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:0.15.0'
//             args '-v /var/run/docker.sock:/var/run/docker.sock -u root'
        }
    }

    stages {
        stage('checkout project') {
            steps{
                sh 'ls -la'
            }
        }

//         stage("terraform init") {
//             steps {
//                 sh 'terraform init'
//             }
//         }
//
//         stage("terraform apply") {
//             steps {
//                 sh 'terraform apply -var yandex_token="${YANDEX_TOKEN}" -var yandex-cloud-id="${YANDEX_CLOUD_ID}" -var yandex-folder-id=${YANDEX_FOLDER_ID} -var yandex-zone=${YANDEX_ZONE}'
//             }
//         }
    }
}