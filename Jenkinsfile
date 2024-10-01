node {
    stage('SCM') {
     checkout scm
    }

    stage('Build and SonarQube Analysis') {
        // Build the Docker image
        sh 'curl http://host.docker.internal:9000'
        sh 'docker build -t my-sonar-image .'

        sh 'docker run --rm my-sonar-image java -version'

        // Run the container, executing the SonarQube analysis
        sh 'docker run --rm my-sonar-image'
    }
}