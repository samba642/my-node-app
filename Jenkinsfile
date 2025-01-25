pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'my-docker-image'
        KUBE_NAMESPACE = 'default'
        KUBE_DEPLOYMENT = 'my-app-deployment'
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE:${env.BUILD_NUMBER} ."
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'samba642/test-node-app:tagname']) {
                    sh "docker push $DOCKER_IMAGE:${env.BUILD_NUMBER}"
                }
            }
        }
        // stage('Deploy to Kubernetes') {
        //     steps {
        //         withKubeConfig([credentialsId: 'kubernetes-credentials']) {
        //             sh """
        //             kubectl set image deployment/$KUBE_DEPLOYMENT \
        //             $KUBE_DEPLOYMENT=$DOCKER_IMAGE:${env.BUILD_NUMBER} \
        //             --namespace=$KUBE_NAMESPACE
        //             """
        //         }
        //     }
        // }
    }
    post {
        always {
            cleanWs()
        }
    }
}
