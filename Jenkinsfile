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
                echo 'Starting registry upload'
                sh '''docker push rathneesh/devops-demo:${BUILD_NUMBER}
         '''
            }
        }
         stage('pre-prod deployment') {
            steps {
                echo 'Starting pre-prod deployment'
                sh '''sh deploy.sh pre-prod rathneesh/devops-demo:${BUILD_NUMBER}
         '''
            }
        }
         stage('prod deployment') {
            steps {
                echo 'Starting prod deployment'
                sh '''sh deploy.sh pre-prod rathneesh/devops-demo:${BUILD_NUMBER}
         '''
            }
        }
    }
}
