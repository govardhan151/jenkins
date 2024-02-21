pipeline {
    agent any

    environment {
        // Define any environment variables if needed
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from GitLab
                git credentialsId: '1', url: 'https://gitlab.com/govardhanreddy1/test.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Use Node.js LTS
                sh 'nvm install --lts'
                sh 'nvm use --lts'

                // Install project dependencies
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Build the React app
                sh 'npm run build'
            }
        }

        stage('Docker Build and Publish') {
            steps {
                // Build Docker image with Jenkins build number as tag
                script {
                    def dockerImageTag = "govardhanreddy151/jenkinsimage:${env.BUILD_NUMBER}"
                    docker.build(dockerImageTag)
                    docker.withRegistry('https://your-docker-registry', '2') {
                        docker.image(dockerImageTag).push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                // Add deployment steps here, if applicable
            }
        }
    }

    post {
        always {
            // Clean up or perform cleanup steps, if needed
        }
    }
}
