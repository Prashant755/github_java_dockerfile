
# Stage 1: Build Java application
FROM maven:3.6.3-jdk-8 AS BUILD

WORKDIR /app

COPY . .

RUN mvn clean package

# Stage 2: Run Java application
FROM eclipse-temurin:8-jre-alpine

WORKDIR /app

COPY --from=BUILD /app/target/demo-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/demo-0.0.1-SNAPSHOT.jar"]
