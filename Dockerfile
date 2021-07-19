FROM tomcat:8-jre8
ENTRYPOINT ["java", "jar", "/webAppExample.war"]
