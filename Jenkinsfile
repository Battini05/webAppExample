pipeline {
    agent any
   environment {
        PATH = "/opt/apache-maven-3.8.1/bin/:$PATH"
    }
   stages {
      stage('checkout') {
           steps {
                git branch: 'master', url: 'https://github.com/Battini05/webAppExample.git'
          }
        }
  stage('Execute maven') {
           steps {
                sh 'mvn clean package'             
          }
        }
stage('Docker Build and Tag') {
           steps {
                sh 'docker build -t battininaveen/build-and-deploy:latest .'
                //sh 'docker tag build-and-deploy battininaveen/build-and-deploy:latest'
                //sh 'docker tag build-and-deploy battininaveen/build-and-deploy:$BUILD_NUMBER'   
          }
        }
     
  stage('Publish image to Docker Hub') {  
            steps {
        withDockerRegistry([ credentialsId: '1a6fcbed-4458-45a1-bc1f-52482bcd41d8', url: "" ]) {
          sh  'docker push battininaveen/build-and-deploy:latest'
        //  sh  'docker push battininaveen/build-and-deploy:$BUILD_NUMBER' 
        }
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
   {
                sh "docker run -d -p 8003:8080 battininaveen/build-and-deploy"
 
            }
        }
 stage('Run Docker container on remote hosts') {
            steps {
                sh "docker -H ssh://jenkins@18.119.106.137 run -itd -p 8003:8080 battininaveen/build-and-deploy"
            }
        }
    }
 }
