pipeline {

  agent any

  tools {nodejs "/root/.nvm/versions/node/v13.12.0/bin/node"}

  stages {
    stage('Linting') {
      steps {
        sh 'npx eslint -c .eslintrc.json app.js'
      }
    }
    stage('Build & Push Docker Image') {
       steps{
          sh 'docker build -t muddge/node-app .'
          sh 'docker login --username=muddge -p="$DOCKER_PASSWORD"'
          sh 'docker push "muddge/node-app'
            }
          }
    stage('Remove Image'){
        steps{
          sh 'docker rmi node-app:+"$BUILDNUMBER"'
        }
    }
  }
}
