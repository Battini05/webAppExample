pipeline {
    agent any
 
   tools
    {
       maven "Maven"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/Battini05/webAppExample.git'
             
          }
        }
  stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t build-and-deploy:latest .' 
                sh 'docker tag build-and-deploy battininaveen/build-and-deploy:latest'
                //sh 'docker tag build-and-deploy battininaveen/build-and-deploy:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
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
                sh "docker -H ssh://jenkins@3.142.194.47 run -d -p 8003:8080 battininaveen/build-and-deploy"
 
            }
        }
    }
 }
