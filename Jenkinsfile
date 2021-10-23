pipeline {
    agent {
        docker {
            image 'maven:3.8.1-adoptopenjdk-11'
            args '-v /root/.m2:/root/.m2'
        }
    }
    //for deliver maven
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') { 
            steps {
                sh 'mvn test' 
            }
            post {
                always {
                   junit allowEmptyResults: true, testResults: '**/surefire-reports/*.xml'
                    // warning Next generation pluging
                    recordIssues enabledForFailure: true, aggregatingResults: true, tool: checkStyle(pattern: 'checkstyle-result.xml')
                }
            }
        }
        //for deliver maven
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
    }
}
