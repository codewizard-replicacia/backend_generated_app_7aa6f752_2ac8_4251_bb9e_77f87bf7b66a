FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY pom.xml pom.xml
COPY jpa jpa
COPY backend_generated_app_7aa6f752_2ac8_4251_bb9e_77f87bf7b66a backend_generated_app_7aa6f752_2ac8_4251_bb9e_77f87bf7b66a
RUN mvn clean package -DnoTest=true

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/backend_generated_app_7aa6f752_2ac8_4251_bb9e_77f87bf7b66a/target/generated_app-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar generated_app-0.0.1-SNAPSHOT.jar"]