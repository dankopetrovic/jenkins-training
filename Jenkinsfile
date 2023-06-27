pipeline {
  agent {
    docker {
      image 'jenkins-cypress/included:12.15.0'
       args '-u root --entrypoint=""'
    }
  }
  environment {
    NO_COLOR=1
  }
  stages {
    stage('Run Cypreess Tests') {
      steps {
        sh 'npx cypress run'
      }
    }
  }
}