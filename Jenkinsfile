pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Starting docker build'
                sh '''docker build . -t rathneesh/devops-demo:${BUILD_NUMBER}
         '''
            }
        }
        stage('Registry Upload') {
            steps {
                echo 'Starting docker build'
                sh '''docker push rathneesh/devops-demo:${BUILD_NUMBER}
         '''
            }
        }
    }
}
