# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="a01732343@itesm.mx"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8151

# The application's jar file
ARG JAR_FILE=target/postgres-api-0.1.jar

# Add the application's jar to the container
ADD ${JAR_FILE} postgres-api.jar

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/postgres-api.jar"]

# docker build
# sudo docker build -t <dockerhub-user>/postgres-demo .

# docker run
# sudo docker run --name <linuxuser>-api -p 8xxx:8080 -d <dockerhub-user>/postgres-demo  
