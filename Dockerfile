FROM tomcat:8.0-alpine
COPY web/target/time-tracker-web-0.5.0-SNAPSHOT.war /usr/local/tomcat/mavenapps
