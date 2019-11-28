FROM anapsix/alpine-java
LABEL maintainer="hopegeng@gmail.com"

COPY /target/spring-petclinic-*.jar /home/

CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]


