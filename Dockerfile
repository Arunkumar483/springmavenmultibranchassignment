FROM maven:3.6-jdk-11-slim as BUILD
ARG BRANCH
RUN apt-get update
RUN apt-get install -y git
WORKDIR /src
RUN echo $BRANCH
RUN git clone --single-branch -b $BRANCH https://github.com/Arunkumar483/springmavenmultibranchassignment.git .
RUN mvn clean install

FROM openjdk:11.0.1-jre-slim-stretch
EXPOSE 8080
WORKDIR /app
ARG JAR=hello-0.0.1-SNAPSHOT.jar

COPY --from=BUILD /src/target/$JAR /app.jar
ENTRYPOINT ["java","-jar","/app.jar"] 