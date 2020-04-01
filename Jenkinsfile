pipeline {

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
          sh 'docker build --tag node-app:+"$BUILDNUMBER"'
          sh 'docker login --username=muddge -p="$DOCKER_PASSWORD"'
          sh 'docker push muddge/node-app:+"$BUILDNUMBER"'
            }
          }
        }
    }
    stage('Remove Image'){
        steps{
          sh 'docker rmi node-app:+"$BUILDNUMBER"'
        }
    }
  }
}
