FROM lolhens/baseimage-openjre
CMD mkdir /target
ADD /target/springbootApp.jar springbootApp.jar
EXPOSE 80
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
