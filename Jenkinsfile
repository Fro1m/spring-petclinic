node {
    stage('SCM') {
        checkout scm
    }

    stage('Build and SonarQube Analysis') {
        // Build the Docker image
        sh 'docker build -t my-sonar-image .'

        // Run the Docker container, which will automatically perform SonarQube analysis
        sh 'docker run --rm my-sonar-image /opt/sonar-scanner/bin/sonar-scanner -X'
    }
}
