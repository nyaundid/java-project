properties([pipelineTriggers([githubPush()])]) 

node('linux'){

    
    stage('Unit Tests'){
        sh "ant -buildfile test.xml"
        
        junit 'reports/*.xml'
    
    }
     stage('Build'){
        git 'https://github.com/nyaundid/java-project.git'
        sh "ant -buildfile build.xml"
    }
    
             stage('Deploy'){
        
        
        sh("aws s3 cp $WORKSPACE/target/ s3://jekins/${env.BRANCH_NAME}/ --recursive --exclude '*' --include '*.jar'")
    }

    
    stage('Reports'){
        
withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-credentials-jekins', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
    // some block
    
       sh 'aws cloudformation describe-stack-resources --stack-name jenkins --region us-east-1' 
    }
  }
}
