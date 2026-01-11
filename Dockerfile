FROM lolhens/baseimage-openjre
CMD mkdir /target
COPY /target/springbootApp.jar springbootApp.jar
EXPOSE 80
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
