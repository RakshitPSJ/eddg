# Pull the code from git repo
FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/RakshitPSJ/eddg.git

# Add gradle to the project
FROM gradle:4.6-jdk8-alpine as build
WORKDIR /app
COPY --from=clone /app/eddg /app

# Creating jar file of project by doing install clean build  stage of gradle
RUN gradle clean build

# ADDING JDK TO PROJECT AND COPYING JAR FILE WHICH CREATED WHILE BUILDING PROJECT AND
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/build/libs/eddg-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["java","-jar","eddg-0.0.1-SNAPSHOT.jar"]
