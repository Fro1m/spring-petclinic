# Use Maven base image
FROM maven:3.8.7-openjdk-17-slim

# Set working directory
WORKDIR /app

# Copy the project files to the container
COPY . .

# Build the project (this step compiles the code and resolves dependencies)
RUN mvn clean install

# Run SonarQube analysis after building the project
RUN mvn sonar:sonar \
    -Dsonar.projectKey=java_project \
    -Dsonar.host.url=http://10.100.102.44:9000 \
    -Dsonar.login=sqp_1ec749bfce621a5d3ef4ddd4d3a3dcf1c5b6fc4d>
