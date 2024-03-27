FROM tomcat:9.0.20-jre8-alpine
RUN apt update && apt install docker.io python3-pip -y
EXPOSE 8081
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
