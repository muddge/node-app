pipeline {

  environment{
    def newApp
    def registry = 'muddge/node-app'
    def registryCredential = 'dockerhub'
  }
  agent any

  tools {nodejs "/root/.nvm/versions/node/v13.12.0/bin/node"}

  stages {
    stage('Example') {
      steps {
        sh 'npm config ls'
      }
    }
    stage('Linting') {
      steps {
        sh 'npx eslint -c .eslintrc.json app.js'
      }
    }
    stage('Build & Push Docker Image') {
       steps{  
         docker.withRegistry( 'https://docker.io/muddge/node-app', 'dockerhub' ) {
                    def buildName = "muddge/node-app:" + "$BUILD_NUMBER"
                        newApp = docker.build buildName
                        newApp.push()
            }
        }
    }
    stage('Remove Image'){
        steps{
          sh 'docker rmi $registry:$BUILD_NUMBER'
        }
    }
  }
}
