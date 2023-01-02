pipeline {
    agent { labe ''}
    stages {
        stage('vcs') {
            steps {
                git url: "https://github.com/satishnamgadda/nopCommerce.git"
                    branch: "develop"
            }
        }
        stage('build') {
            steps {
                docker image build 
            }
        }
    }
}