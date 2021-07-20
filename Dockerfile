FROM tomcat:latest
#LABEL maintainer="Nidhi Gupta"
ADD ./target/webappExample.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
