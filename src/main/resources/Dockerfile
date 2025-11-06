# Use an official Maven image to build the app
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Set working directory inside the container
WORKDIR /app

# Copy project files into container
COPY . .

# Package the application (skip tests for faster build)
RUN mvn clean package -DskipTests

# ----------------------------
# Step 2: Run the built JAR
# ----------------------------
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy only the built jar file from previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port your app runs on (Spring Boot default: 8080)
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
