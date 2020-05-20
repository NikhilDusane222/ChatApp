pipeline {
    agent any
     stages {
     stage('Deploy') { 
           steps {
             sh ''' #! /bin/bash 
             
              aws deploy create-deployment --application-name TFChatApp --deployment-group-name TFCodeDeployGroup --deployment-config-name CodeDeployDefault.AllAtOnce --github-location repository=/NikhilDusane222/ChatApp.git,commitId=${GIT_COMMIT}
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
    post { 
        always { 
            echo 'Stage is success'
        }
    }
    
}
