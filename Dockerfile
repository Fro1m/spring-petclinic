FROM maven:3.8.4-openjdk-17

WORKDIR /app
COPY . .

ENV SONAR_HOST_URL=http://localhost:9000
ENV SONAR_LOGIN=sqp_c417afe287f78c9a192663aadf6f1b35bdcecfbb

CMD ["mvn", "clean", "verify", "sonar:sonar", "-Dsonar.projectKey=java_project", "-Dsonar.projectName='java_project'", "-Dsonar.host.url=$SONAR_HOST_URL", "-Dsonar.token=$SONAR_LOGIN"]