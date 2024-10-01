FROM openjdk:17-jdk-slim

# Install required packages including wget, unzip, and Maven
RUN apt-get update && \
    apt-get install -y wget unzip maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

CMD ["mvn", "sonar:sonar", \
    "-Dsonar.host.url=http://host.docker.internal:9000", \
    "-Dsonar.projectKey=jb3", \
    "-Dsonar.projectName=jb3", \
    "-Dsonar.login=sqp_21c86f6b54c151b4baaa0796fcf1c1d256bfa1f0"]
