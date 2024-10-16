node {
    stage('SCM') {
        checkout scm
    }

    stage('Build and SonarQube Analysis') {
        // Build the Docker image
        def buildNumber = env.BUILD_NUMBER
        sh 'docker build -t my-sonar-image .'
    }
    stage('Login and Push'){
        withCredentials([usernamePassword(credentialsId: 'c14c8869-37cb-44c1-b14a-fba965a4ee3e', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
        }
        sh 'docker tag my-sonar-image fro1m/jb_course_task:latest'
        sh 'docker push fro1m/jb_course_task:latest'
        sh 'docker tag my-sonar-image fro1m/jb_course_task:${buildNumber}'
        sh 'docker push fro1m/jb_course_task:${buildNumber}'
    }
}
