pipeline {

  agent any

  tools {nodejs "/root/.nvm/versions/node/v13.12.0/bin/node"}

  stages {
    stage('Linting') {
      steps {
        sh 'npx eslint -c .eslintrc.json app.js'
      }
    }
    stage('Build Image') {
       steps{
          sh 'docker build -t muddge/node-app .'
          sh 'export PASS=`cat /docker/passwd` ; docker login -u muddge -p $PASS'
          sh 'docker tag muddge/node-app muddge/node-app:"$BUILD_NUMBER"'
            }
          }
    stage('Push Image'){
        steps{
          sh 'docker push muddge/node-app'
        }
    }
    stage('Set current kubectl context'){
        steps{
          sh '/usr/local/bin/kubectl config set-context --current --namespace=node-app'
        }
    }
    stage('Deploy Container'){
        steps{
          sh 'kubectl set image deployment/node-app node-app=docker.io/muddge/node-app:latest'
        }
    }
  }
}
