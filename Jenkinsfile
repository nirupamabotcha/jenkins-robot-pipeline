pipeline {
    agent any
    
    // triggers {
    //     // Trigger the pipeline on push to repository
    //     githubPush()
        
    //     // Alternative: Poll SCM periodically
    //     // pollSCM('H/15 * * * *')  // Polls every 15 minutes
    // }
    
    environment {
        // Define environment variables
        PYTHON_VERSION = '3.8'
        ROBOT_RESULTS_DIR = 'results'
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
                echo 'Code checkout completed'
            }
        }
        
        stage('Setup Environment') {
            steps {
                // Create a Python virtual environment and install dependencies
                sh '''
                    python -m venv venv
                    . venv/bin/activate
                    pip install --upgrade pip
                    pip install robotframework
                    pip install robotframework-seleniumlibrary
                    pip install robotframework-requests
                '''
                echo 'Environment setup completed'
            }
        }
        
        stage('Run Tests') {
            steps {
                // Create results directory if it doesn't exist
                sh 'mkdir -p ${ROBOT_RESULTS_DIR}'
                
                // Run Robot Framework tests
                sh '''
                    . venv/bin/activate
                    robot --outputdir ${ROBOT_RESULTS_DIR} tests/
                '''
            }
            post {
                always {
                    // Archive the test results
                    robot outputPath: "${ROBOT_RESULTS_DIR}", 
                          logFileName: 'log.html',
                          outputFileName: 'output.xml',
                          reportFileName: 'report.html',
                          passThreshold: 100,
                          unstableThreshold: 75
                }
            }
        }
        
        stage('Code Analysis') {
            steps {
                // Run static code analysis (optional)
                sh '''
                    . venv/bin/activate
                    pip install pylint
                    pylint --exit-zero src/
                '''
                echo 'Code analysis completed'
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline execution failed!'
        }
        always {
            // Clean up workspace (optional)
            cleanWs()
        }
    }
}
