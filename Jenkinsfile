pipeline {
    agent any
    tools {
        nodejs 'nodejs-19'
    }
    stages {
        stage('Git Checkout'){
            steps {
                git branch: 'main', url: 'https://github.com/RAM28EC/Nodejscicd.git'
            }
        }
        stage('install dependencies'){
            steps {
                sh 'npm install'
            }
        }
        stage('owasp dependency check') {
            steps {
                dependencyCheck additionalArguments: '--scan ./ ', odcInstallation: 'DP-OWASP'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml' 
            }
        }
        
        stage('Deploy the application to Docker container') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'de23910c-dc83-4fd8-b60c-08b40bdb2ab3', toolName: 'docker', url: 'https://index.docker.io/v1/'){
                        sh "docker build -t nodeimage ."
                        sh "docker tag nodeimage 28cloud/nodejsimage:v3"
                        sh "docker push 28cloud/nodejsimage:v3"
                        sh "docker run -d --name nodejscontainer1 -p 8085:8095 28cloud/nodejsimage:v3"
                    }
                }
            }
        }

    }
}