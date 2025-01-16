pipeline {
    agent any  // Runs on any available agent

    environment {
        DOCKER_IMAGE = 'mabdullah773/final' // Docker image you specified
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_USER = 'mabdullah773'
        // pas user directly used
        DOCKER_PASS = 'dckr_pat_5VVv4TcG4CT6gqQes5sY5arrQ2k'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // This step pulls the repository from GitHub
                echo 'Cloning repository...'
                checkout scm  // This clones the repository defined in the job configuration
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image: ${DOCKER_IMAGE}"
                    // Use 'bat' instead of 'sh' for Windows
                    bat 'docker build -t %DOCKER_IMAGE% .'
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Log into Docker Hub using credentials
                    echo "Logging into Docker Hub"
                    
                    bat """
                        echo %DOCKER_PASS% | docker login %DOCKER_REGISTRY% -u %DOCKER_USER% --password-stdin
                    """
                    
                    // Push the Docker image
                    echo "Pushing Docker image: ${DOCKER_IMAGE}"
                    
                    bat """
                        docker push %DOCKER_IMAGE%
                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
