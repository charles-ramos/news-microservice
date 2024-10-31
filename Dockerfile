FROM maven:3.8.3-openjdk-21-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21-jre-slim
COPY --from=build /app/target/myapp.jar /myapp.jar
EXPOSE 8080
CMD ["java", "-jar", "/myapp.jar"]