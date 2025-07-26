pipeline {
    tools {
        maven 'Maven-3.9.10'
    }
    environment {
        registry = "856511401021.dkr.ecr.us-east-2.amazonaws.com/ecr-eks-demo-july2025"
    }
    agent any

    stages {
        stage('CheckOut') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jayanjay/springboot-app.git']])
            }
        }
        
        stage('Build Jar') {
            steps {
            sh 'mvn clean install'           
            }
        }
        
        stage ('Build Image'){
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }
// Update below details ECR push commands section
         stage ('Push into ECR') {
             steps {
                    sh "aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 856511401021.dkr.ecr.us-east-2.amazonaws.com"
                    sh "docker push 856511401021.dkr.ecr.us-east-2.amazonaws.com/ecr-eks-demo-july2025:latest"
             }
         }
// Add the secret file in Credential section         
         stage('K8S Deploy') {
          steps{   
            script {
                withKubeConfig([credentialsId: 'K8S']) {
                sh('kubectl apply -f eks-deploy-k8s.yaml')
               }
            }
        }
       }
       
    }
}

