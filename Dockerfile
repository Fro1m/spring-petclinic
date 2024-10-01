FROM sonarqube:latest

# Install dependencies for downloading sonar-scanner
RUN apt-get update && \
    apt-get install -y wget unzip

# Download and install Sonar Scanner CLI
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip && \
    unzip sonar-scanner-cli-4.8.0.2856-linux.zip && \
    mv sonar-scanner-4.8.0.2856-linux /opt/sonar-scanner && \
    ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner

# Set the Sonar Scanner in PATH
ENV PATH "$PATH:/opt/sonar-scanner/bin"

# Ensure the scanner can find the Java runtime
ENV SONAR_SCANNER_OPTS="-server"

# Set environment variables for Sonar Scanner configuration if needed
ENV SONAR_SCANNER_HOME=/opt/sonar-scanner

# Make sure SonarQube starts as expected
ENTRYPOINT ["/opt/sonarqube/bin/run.sh"]

WORKDIR /app
COPY . .

CMD ["sonar-scanner", "-Dsonar.projectKey=java_project", "-Dsonar.sources=.", "-Dsonar.host.url=http://localhost:9000", "-Dsonar.token=${SONAR_LOGIN}"]
