FROM maven:3.5-jdk-8-alpine as build
ADD pom.xml ./pom.xml
ADD src ./src
RUN mvn package -DskipTests

FROM openjdk:8-jre-alpine
COPY --from=build /target/JCG-BootKafka-Example-*.jar /helloworld.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/helloworld.jar"]
