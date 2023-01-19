pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Starting docker build'
                sh '''docker build .
         '''
            }
        }
    }
}
