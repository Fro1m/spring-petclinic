node {
    stage('SCM') {
     checkout scm
    }

    stage('Build and SonarQube Analysis') {
        // Build the Docker image
        sh 'docker build -t my-sonar-image .'

        // Run the container, executing the SonarQube analysis
        sh 'docker run --rm my-sonar-image'
    }
}