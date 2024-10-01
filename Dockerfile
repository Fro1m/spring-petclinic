FROM openjdk:17-jdk-slim

# Install required packages including wget, unzip, and Maven
RUN apt-get update && \
    apt-get install -y wget unzip maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up environment variables for Java 17
# Update JAVA_HOME to the correct JDK path
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH
ENV SONAR_SCANNER_OPTS="-Xmx512m -Djava.home=$JAVA_HOME"

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Run Maven to build the project
RUN mvn clean install

# Define the default command to run the SonarQube scanner
CMD ["mvn", "sonar:sonar", \
    "-Dsonar.host.url=http://sonarqube:9000", \
    "-Dsonar.projectKey=jb3", \
    "-Dsonar.projectName=jb3", \
    "-Dsonar.login=sqp_21c86f6b54c151b4baaa0796fcf1c1d256bfa1f0"]
