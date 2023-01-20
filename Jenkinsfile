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
                echo "docker push rathneesh/devops-demo:${BUILD_NUMBER}"
            }
        }
         stage('pre-prod deployment') {
            steps {
                echo 'Starting pre-prod deployment'
                sh '''sh deploy.sh pre-prod rathneesh/devops-demo:${BUILD_NUMBER}
                echo "pre-prod deployment is successful"
                echo "Please review the pre-prod environment @ http://139.59.27.4:81/"

         '''
            }
        }
         stage('prod deployment') {
            steps {
                input message: 'Do you want to approve the deploy in production?', ok: 'Yes'
                echo 'Starting prod deployment'
                sh '''sh deploy.sh prod rathneesh/devops-demo:${BUILD_NUMBER}
                echo "prod deployment is successful - http://139.59.27.4:80/"
         '''
            }
        }
    }
}
