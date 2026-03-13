pipeline {
    agent any

    environment {
        IMAGE_NAME = "ht024112001/finead-todo-app:latest"
    }

    stages {

        stage('Build') {
            steps {
                sh 'cd TODO/todo_backend && npm install'
                sh 'cd TODO/todo_frontend && npm install'
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
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh '''
                    echo $PASS | docker login -u $USER --password-stdin
                    docker push $IMAGE_NAME
                    '''
                }
            }
        }

    }
}