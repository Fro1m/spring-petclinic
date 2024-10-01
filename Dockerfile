FROM openjdk:17-jdk-slim

# Install wget and unzip
RUN apt-get update && apt-get install -y wget unzip

# Install SonarQube Scanner
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip \
    && unzip sonar-scanner-cli-4.6.2.2472-linux.zip \
    && mv sonar-scanner-4.6.2.2472-linux /opt/sonar-scanner \
    && rm sonar-scanner-cli-4.6.2.2472-linux.zip

# Export the Sonar Scanner binaries to PATH\
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH $PATH:/opt/sonar-scanner/bin

# Set up any environment variables required for Sonar Scanner
ENV SONAR_SCANNER_OPTS="-Xmx512m -Djava.home=$JAVA_HOME"

WORKDIR /app
COPY . .

CMD ["sonar-scanner", "-Dsonar.projectKey=jb3", "-Dsonar.projectName='jb3'", "-Dsonar.host.url=http://host.docker.internal:9000", "-Dsonar.token=sqp_21c86f6b54c151b4baaa0796fcf1c1d256bfa1f0"]
