node {
  stage('SCM') {
    checkout scm
  }
  stage('Check Java Version') {
    sh 'java -version'
  }
  stage('SonarQube Analysis') {
    def mvn = tool 'maven';
    withSonarQubeEnv() {
      sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=johnbryce -Dsonar.projectName='johnbryce' -Dsonar.skip=true"
    }
  }
}