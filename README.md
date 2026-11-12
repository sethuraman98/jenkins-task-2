
# Jenkins Task 2 - GitHub Webhook CI Pipeline

## Project Overview

This project demonstrates Continuous Integration using Jenkins, AWS EC2, and GitHub.

Whenever a developer pushes a commit to the GitHub repository, a webhook notifies Jenkins. Jenkins automatically checks out the repository, executes a Linux shell script, and sends the build status and console log through Gmail.

## Architecture

GitHub Repository
       |
       | Git Push
       v
GitHub Webhook
       |
       v
Jenkins on AWS EC2
       |
       v
Checkout Repository
       |
       v
Execute Shell Script
       |
       v
Build Status
       |
       v
Gmail Notification

## Technologies Used

- AWS EC2
- Amazon Linux 2023
- Jenkins LTS
- Java 21
- Git
- GitHub
- Shell Scripting
- Gmail SMTP

## Repository Structure

    jenkins-task-2/
    |
    |-- scripts/
    |   |-- system-info.sh
    |
    |-- Jenkinsfile
    |
    |-- README.md

## Project Implementation

### 1. Jenkins Installation

Jenkins was installed on an AWS EC2 instance running Amazon Linux 2023.

Java 21 was configured as the Jenkins runtime.

### 2. GitHub Integration

A public GitHub repository was created and connected to Jenkins using the Git SCM integration.

### 3. Pipeline Configuration

The Jenkins pipeline is maintained in the repository using a Jenkinsfile.

Pipeline stages:

1. Checkout Verification
2. Execute Shell Script
3. Build Completed

### 4. Shell Script Execution

The system-info.sh script collects:

- Build timestamp
- Hostname
- Operating system
- Current username
- Disk usage
- Memory usage

### 5. GitHub Webhook

A GitHub webhook was configured to notify Jenkins whenever a push event occurs.

Jenkins is configured with the GitHub hook trigger for GITScm polling option.

### 6. Email Notification

Jenkins Email Extension Plugin is configured with Gmail SMTP.

Build notifications contain:

- Job name
- Build number
- Build status
- Build URL
- Console output
- Console log attachment

Gmail App Password is stored securely in Jenkins Credentials.

No passwords or secrets are stored in this repository.

## Validation

The first manual Jenkins build completed successfully.

Verified:

- GitHub repository checkout
- Shell script execution
- Linux system information output
- Successful Jenkins pipeline execution
- Gmail build notification received

Automatic webhook triggering is tested through subsequent GitHub push events.

## Security Practices

- Gmail credentials are stored in Jenkins Credentials.
- No passwords are committed to GitHub.
- Jenkins access is restricted using AWS Security Groups.
- GitHub webhook source IP ranges are allowlisted.
- HTTPS should be configured for production deployments.

## Repository

GitHub: https://github.com/sethuraman98/jenkins-task-2
