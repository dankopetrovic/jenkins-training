//This pipeline is configured to use a Docker container as a Jenkins build agent
//for prerequisites see
 
pipeline {
  agent none
  //We recommend to discard old builds due disk storage
  options {
    buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '1', daysToKeepStr: '', numToKeepStr: '3')
  }
  //we will run two sperate stages in this pipeline
  //first stage will run the test, second stage will archive the screenshots and publish the reports
  stages {
    stage('Run Tests') {
        environment {
            NO_COLOR=1
        }
        agent {
        //here we define the docker agent the image is sourced from a private registry with credentials managed in Jenkins
        //user needs to be set to root at this point since jenkins does not support any use of docker images where the Working directory is not auto mounted
        docker {
          image 'jenkins-cypress/included:12.15.0'
          args '-u root --entrypoint=""'
        }
      }
      steps {
        //line is needed to have two seperate stages for archiving and running the tests
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            sh 'cp -Rf $PWD/cypress /cypress-docker/'
          //here we switch to the working directory of the container, create a results folder(this operation need root user)
          //then we set the NO_COLOR flag for better output of the console logs in jenkins and run the tests
          sh 'cd /cypress-docker && npx cypress run'
        }     
      }
    }
  }
}