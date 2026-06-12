pipeline {
    agent any

    triggers {
        pollSCM('H/1 * * * *')
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Jenkins conseguiu ler o repositório'
                sh 'ls -la'
            }
        }

        stage('Validar manifests') {
            steps {
                echo 'Listando arquivos Kubernetes'
                sh 'ls -la k8s'
            }
        }
    }
}
