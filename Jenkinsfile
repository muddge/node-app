pipeline {
    
  def newApp
  def registry = 'muddge/node-app'
  def registryCredential = 'dockerhub'
  
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
         docker.withRegistry( 'https://' + registry, registryCredential ) {
		    def buildName = registry + ":$BUILD_NUMBER"
			newApp = docker.build buildName
			newApp.push()
        }
    }
    stage('Remove Image'){
        sh 'docker rmi $registry:$BUILD_NUMBER'
    }
  }
}
