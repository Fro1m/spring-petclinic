FROM maven:3.8.4-openjdk-17

RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip && \
    unzip sonar-scanner-cli-4.6.2.2472-linux.zip && \
    mv sonar-scanner-4.6.2.2472-linux /opt/sonar-scanner && \
    ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner

ENV PATH="/opt/sonar-scanner/bin:${PATH}"

WORKDIR /app
COPY . .

ENV SONAR_HOST_URL=http://localhost:9000
ENV SONAR_LOGIN=sqp_c417afe287f78c9a192663aadf6f1b35bdcecfbb

CMD ["mvn", "clean", "verify", "sonar:sonar", "-Dsonar.projectKey=java_project", "-Dsonar.projectName='java_project'", "-Dsonar.host.url=$SONAR_HOST_URL", "-Dsonar.token=$SONAR_LOGIN"]