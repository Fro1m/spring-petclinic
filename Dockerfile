FROM openjdk:17-jdk-slim

# Install required packages including wget, unzip, and Maven
RUN apt-get update && \
    apt-get install -y wget unzip maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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

CMD ["mvn", "sonar:sonar", \
    "-Dsonar.host.url=http://host.docker.internal:9000", \
    "-Dsonar.projectKey=jb3", \
    "-Dsonar.projectName=jb3", \
    "-Dsonar.login=sqp_21c86f6b54c151b4baaa0796fcf1c1d256bfa1f0"]
