#FROM tomcat:8-jre8
#ENTRYPOINT ["java", "jar", "/webAppExample.war"]

FROM tomcat:8-jre8
#ADD target/webAppExample-0.0.1-SNAPSHOT.war webApp.war
EXPOSE 8086
ENTRYPOINT ["java","-jar","webApp.war"]
