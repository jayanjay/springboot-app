FROM eclipse-temurin:17-jre
ADD target/*.jar springbootApp.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
