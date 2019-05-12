properties([pipelineTriggers([githubPush()])])

node('linux'){
  stage('Clone'){
     git credentialsId: 'c8aa5159-d9c1-4bdf-93c4-9c51b3581212', url: 'https://github.com/nyaundid/test.git'

  }

