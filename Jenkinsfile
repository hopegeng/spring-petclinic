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
                withCredentials( [usernamePassword(credentialsId: "dockerhub_ID", passwordVariable: 'dockerhubPassword', usernameVariable: "dockerhubUser") ] ) {
                    sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
                    sh "docker push hopegeng/spring-petclinic:latest"
                }
            }
        }
    }
}

