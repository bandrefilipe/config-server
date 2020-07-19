FROM gradle:6.3-jdk11 AS builder
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build

FROM openjdk:11-slim
LABEL author="Andre Filipe Barranco"
LABEL email="b.andrefilipe@gmail.com"
COPY --from=builder /home/gradle/src/build/libs/*.jar /app/
WORKDIR /app
ENTRYPOINT java -jar *.jar
EXPOSE 8888
