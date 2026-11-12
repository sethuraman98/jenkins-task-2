
pipeline {
    agent any

    options {
        timestamps()
    }

    stages {

        stage('Checkout Verification') {
            steps {
                echo 'GitHub repository checkout completed'
                sh 'git rev-parse --short HEAD'
            }
        }

        stage('Execute Shell Script') {
            steps {
                echo 'Executing system information script'

                sh '''
                    chmod +x scripts/system-info.sh
                    ./scripts/system-info.sh
                '''
            }
        }

        stage('Build Completed') {
            steps {
                echo 'Jenkins Task 2 completed successfully'
            }
        }
    }

    post {
        always {
            emailext(
                to: 'cssethuraman98@gmail.com',
                subject: "Jenkins Build: ${env.JOB_NAME} - ${currentBuild.currentResult} - #${env.BUILD_NUMBER}",
                mimeType: 'text/plain',
                attachLog: true,
                body: """
Hello,

Jenkins pipeline execution has completed.

Project: ${env.JOB_NAME}
Build Number: ${env.BUILD_NUMBER}
Build Status: ${currentBuild.currentResult}

Build URL:
${env.BUILD_URL}

Build Console Output:
\${BUILD_LOG, maxLines=100}

Regards,
Jenkins CI Server
"""
            )
        }
    }
}
