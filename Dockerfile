FROM openjdk:17-jdk-slim

# Install wget and unzip
RUN apt-get update && apt-get install -y wget unzip

# Install SonarQube Scanner
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip \
    && unzip sonar-scanner-cli-4.6.2.2472-linux.zip \
    && mv sonar-scanner-4.6.2.2472-linux /opt/sonar-scanner \
    && rm sonar-scanner-cli-4.6.2.2472-linux.zip

# Export the Sonar Scanner binaries to PATH
ENV PATH $PATH:/opt/sonar-scanner/bin

# Set up environment variables for Java 17
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV SONAR_SCANNER_OPTS="-Xmx512m -Djava.home=$JAVA_HOME"

# Set working directory
WORKDIR /app

# Copy project files
COPY sonar-project.properties .
COPY . .
RUN chmod -R 755 /app

# Define the default command to run the SonarQube scanner with Java 17
CMD ["sonar-scanner", \
    "-X", \
    "-Dsonar.projectBaseDir=/app", \
    "-Dsonar.projectKey=jb3", \
    "-Dsonar.projectName=jb3", \
    "-Dsonar.host.url=http://sonarqube:9000", \
    "-Dsonar.login=sqp_21c86f6b54c151b4baaa0796fcf1c1d256bfa1f0"]