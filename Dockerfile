FROM lolhens/baseimage-openjre
ADD target/springbootApp-0.0.1.jar springbootApp.jar
EXPOSE 80
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
