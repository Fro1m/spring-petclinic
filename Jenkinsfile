node {
    stage('SCM') {
        checkout scm
    }

    stage('Build and SonarQube Analysis') {
        // Build the Docker image
        sh 'docker build -t my-sonar-image .'
    }
    stage('Run'){
        // Run the Docker container
        sh 'docker run --rm my-sonar-image'
    }
}
