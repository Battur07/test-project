pipeline{
    agent any
    tools {
        git 'GIT'
    }
    stages {
        stage('Clone Repo') {
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Battur07/test-project.git']])
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                  sh 'docker build -t docker-image1:latest .'
                }
            }
        }
        stage('Deploy Docker Image') {
            steps {
                script {
                def containerExists = sh(script: 'sudo docker ps -a | grep docker-image1-service', returnStatus: true) == 0
                if(containerExists){
                sh 'sudo docker stop docker-image1-service'
                sh 'sudo docker rm docker-image1-service'
                }
                }
             sh 'sudo docker run -p 3000:3000 --name docker-image1-service docker-image1:latest'
            }
        }
    }
}
