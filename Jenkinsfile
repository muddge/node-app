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
          sh 'docker login -u muddge'
          sh 'docker tag muddge/node-app muddge/node-app:$BUILDNUMBER'
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
