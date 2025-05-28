FROM eclipse-temurin:17-jdk-alpine

RUN addgroup -S ps-task && adduser -S ps-adagher -G ps-task

WORKDIR /progressoft-task

ARG JAR_FILE=target/*.jar

COPY ${JAR_FILE} assignment.jar

USER ps-adagher

ENV SPRING_PROFILES_ACTIVE=h2

EXPOSE 8090

ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=h2", "assignment.jar"]
