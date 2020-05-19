pipeline {
    agent any
      options {
            buildDiscarder(logRotator(numToKeepStr: '7'))
              
   stages {    
     stage('Deploy') { 
           steps {
             sh ''' #! /bin/bash 
             
             aws deploy create-deployment --application-name ChatApplication --deployment-group-name ChatApplication-dg --deployment-config-name CodeDeployDefault.AllAtOnce --github-location repository=https://github.com/NikhilDusane222/ChatApp.git,commitId=${GIT_COMMIT}
             '''
            }
        }
        
     stage('status'){
            steps {
            sh ''' #! /bin/bash
            echo Deployment started
            '''
            }  
        }
        
    }
}
    post { 
        always { 
            echo 'Stage is success'
        }
    }

}    
    
