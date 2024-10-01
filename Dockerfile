FROM openjdk:17-jdk-slim

# Set up environment variables for Java 17
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV SONAR_SCANNER_OPTS="-Xmx512m -Djava.home=$JAVA_HOME"

# Set working directory
WORKDIR /app

# Copy project files
COPY . .
RUN mvn clean install

# Define the default command to run the SonarQube scanner with Java 17
CMD ["mvn", "clean", "verify", "sonar:sonar", "-Dsonar.token=sqp_21c86f6b54c151b4baaa0796fcf1c1d256bfa1f0"]