pipeline {
    agent any

    triggers {
        pollSCM('H/1 * * * *')
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Baixando código do GitHub'
                checkout scm
            }
        }

        stage('Inspecionar Projeto') {
            steps {
                echo 'Listando arquivos do projeto'
                sh 'ls -lah'
                sh 'ls -lah k8s'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Construindo imagem Docker'
                sh 'docker build -t kube-news-app:test .'
            }
        }

        stage('Validar Manifests Kubernetes') {
            steps {
                echo 'Validando arquivos Kubernetes'
                sh 'grep "kind:" k8s/*.yaml'
            }
        }

        stage('Validar YAML') {
            steps {
                echo 'Testando YAMLs Kubernetes'
                sh 'kubectl apply --dry-run=client -f k8s/'
            }
        }

    }

    post {
        success {
            echo 'Pipeline executada com sucesso'
        }

        failure {
            echo 'Pipeline falhou'
        }
    }
}
