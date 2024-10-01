FROM sonarqube:latest

WORKDIR /app
COPY . .

CMD ["sonar-scanner", "-Dsonar.projectKey=jb3", "-Dsonar.projectName='jb3'", "-Dsonar.host.url=http://10.100.102.44:9000", "-Dsonar.token=sqp_21c86f6b54c151b4baaa0796fcf1c1d256bfa1f0"]
