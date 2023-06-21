pipeline {
  agent any
  stages {
        stage('Cypress tests') {
            steps {
                sh 'docker run -v $PWD:/e2e -w /e2e cypress/included:12.15.0' 
            }
        }
    }
}
