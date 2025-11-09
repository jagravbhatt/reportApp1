# Stage 1: Build
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Deploy
FROM tomcat:10.1-jdk17
WORKDIR /usr/local/tomcat/webapps/
COPY --from=builder /app/target/report-app-0.0.1-SNAPSHOT.war app.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
