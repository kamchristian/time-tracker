pipeline {
    agent {
        docker {
            image 'maven:3.8.1-adoptopenjdk-11'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                mvn -B -DskipTests clean package
                cp -r app/build/test-results $WORKSPACE/test-results
                '''
            }
        }
        stage('Test') { 
            steps {
                sh 'mvn test' 
            }
            post {
                always {
                    
                    junit '**/build/test-reports/*.xml'
 
                }
            }
        }
    }
}
