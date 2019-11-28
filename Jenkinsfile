#!groovy

pipeline {
    agent none
    stages {
        stage( 'Maven Install') {
            agent {
                docker {
                    image 'maven:3.5.0'
                }
            }
        
            steps {
                sh 'mvn clean install'
            }
        }

        stage( "Docker Build") {
            agent any
            steps {
                sh 'docker build -t hopegeng/spring-petclinic:latest .'
            }
        }

        stage( "Docker push" ) {
            agent any
            steps {
                withCredentials( [usernamePassword(credentialsId: "dockerhub_ID", passwordVariable: 'dockerhubPassword', usernameVariable: "dockerHubUser") ] ) {
                    sh "docker login -u ${env.dockerhubPassword} -p ${env.dockerHubUser}"
                    sh "docker push hopegeng/spring-petclinic:latest"
                }
            }
        }
    }
}

