FROM sonarqube:latest

WORKDIR /app
COPY . .
#
CMD ["sonar-scanner", "-Dsonar.projectKey=java_project", "-Dsonar.sources=.", "-Dsonar.host.url=http://localhost:9000", "-Dsonar.token=${SONAR_LOGIN}"]
