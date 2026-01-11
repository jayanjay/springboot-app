FROM lolhens/baseimage-openjre
ADD target/*.jar springbootApp.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
