pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/anu1240/Devops-vle6.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("my-app")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker stop my-app || true'
                    sh 'docker rm my-app || true'
                    sh 'docker run -d -p 80:80 --name my-app my-app'
                }
            }
        }
    }

    post {
        success {
            echo '🚀 Deployment Successful! Your e-commerce site is live.'
        }
        failure {
            echo '❌ Deployment Failed! Check logs.'
        }
    }
}