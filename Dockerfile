
  FROM tomcat:8-jre8
  EXPOSE 8085
  ADD /home/jenkins-slave01/workspace/build-and-deploy/target/webappExample.war webappExample.war
  ENTRYPOINT ["java",".jar","webappExample.war"]
