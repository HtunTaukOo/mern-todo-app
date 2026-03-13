pipeline {
    agent any

    environment {
        IMAGE_NAME = "ht024112001/finead-todo-app:latest"
    }

    stages {

        stage('Build') {
            steps {
                sh 'npm install'
            }
        }

        stage('Containerise') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'ht024112001',
                    passwordVariable: '123456789'
                )]) {

                    sh 'docker login -u $USER -p $PASS'
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }

    }
}