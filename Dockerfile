FROM tomcat:latest
#LABEL maintainer="Nidhi Gupta"
ADD ./target/webappExample.war /usr/local/tomcat/webapps/
EXPOSE 8085
CMD ["catalina.sh", "run"]
