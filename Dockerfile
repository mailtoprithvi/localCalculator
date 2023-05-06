# First stage: complete build environment
FROM maven:3.8.3-openjdk-11 AS calculator-build

# add pom.xml and source code
ADD ./pom.xml pom.xml
ADD ./src src/

# package jar
RUN mvn clean install


# Second stage: minimal runtime environment
FROM tomcat:9.0.67-jdk11

# copy jar from the first stage
COPY --from=calculator-build target/calculator.war /usr/local/tomcat/webapps/


# From openjdk11-jdk AS calculator-package

# copy jar from the first stage
# COPY --from=calculator-build target/my-boot-calculator.jar my-boot-calculator.jar

# EXPOSE 8080

# CMD ["java", "-jar", "my-boot-calculators.jar"]

