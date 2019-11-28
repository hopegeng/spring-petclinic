FROM anapsix/alpine-java
LABEL maintainer="hopegeng@gmail.com"

COPY /target/spring-petclinic-*.jar /home/spring-petclinic.jar

CMD ["java","-jar","/home/spring-petclinic.jar"]


