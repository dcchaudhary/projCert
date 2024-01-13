pipeline {
    agent {label 'slave-agent'}
    
    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/dcchaudhary/projCert.git'
            }
        }
        stage('Build docker Image') {
            steps {
                sh 'docker image build -t php-proj-image ${WORKSPACE}'
            }
        }
        stage('Build Container') {
            steps {
                sh 'docker container run -d -p 8082:80 --name phpProj php-proj-image'
            }
        }
        stages('CURL Verify') {
            steps {
                sh 'curl http://slave:8082'
            }
        }
    }
}
