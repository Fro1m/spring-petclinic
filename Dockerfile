# Use Maven base image
FROM maven:sapmachine

# Set working directory
WORKDIR /app

# Copy only the pom.xml and download dependencies (this step will be cached unless pom.xml changes)
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copy the project files to the container
COPY . .

# Build the project (this step compiles the code and resolves dependencies)
RUN ./mvnw clean package -Dcheckstyle.skip=true


# Run SonarQube analysis after building the project
RUN mvn sonar:sonar \
    -Dsonar.projectKey=java_project \
    -Dsonar.host.url=http://10.100.102.44:9000 \
    -Dsonar.login=sqp_1ec749bfce621a5d3ef4ddd4d3a3dcf1c5b6fc4d



