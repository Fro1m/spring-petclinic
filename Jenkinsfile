// node {
//   stage('SCM') {
//     checkout scm
//   }
//   stage('Check Java Version') {
//     sh 'java -version'
//   }
//   stage('SonarQube Analysis') {
//     def mvn = tool 'maven';
//     withSonarQubeEnv() {
//       sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=johnbryce -Dsonar.projectName='johnbryce' -Dsonar.skip=true"
//     }
//   }
// }

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