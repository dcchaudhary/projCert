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
				sh 'docker ps -q --filter "name=phpProj" | grep -q . && docker stop phpProj && docker rm -fv phpProj || true'
				sh 'docker container run -d -p 8082:80 --name phpProj php-proj-image'
			}
        }
        stage('CURL Verify') {
            steps {
                sh 'curl http://slave:8082'
            }
        }
    }
}

