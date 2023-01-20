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
                 input message: 'User input required', ok: 'Release!',
                //parameters: [choice(name: 'RELEASE_SCOPE', choices: 'patch\nminor\nmajor', description: 'What is the release scope?')]
                  input(message: 'Do you want to proceed with prod deployment?', ok: 'Yes', 
                        parameters: [booleanParam(defaultValue: true, 
                         description: 'If you like Java, just push the button',name: 'Yes?')])
                echo 'Starting prod deployment'
                sh '''sh deploy.sh prod rathneesh/devops-demo:${BUILD_NUMBER}
         '''
            }
        }
    }
}
