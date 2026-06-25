pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.7'
            args  '--entrypoint=' // Overrides default entrypoint to let Jenkins control execution
        }
    }
    environment {
        AWS_ACCESS_KEY_ID = credential('AWS_ACCESS_KEY')
        AWS_SECRETE_KEY_ID = credentials('AWS_SECRETE_KEY')
        }
    stages {
        stage('checkout scm') {
            steps {
                sh "checkout scm"
                }
            }
        stage('Terraform init') {
            steps {
                echo "Initialising"
                sh "terraform init"
                }
            }
        stage('Terraform plan') {
            steps {
                echo "Planning steps"
                sh "terraform plan -out=tfplan"
                }
            }
        stage('Terraform apply') {
            steps {
                echo "applying terraform"
                sh "terrafom apply -auto-approve tfplan
                }
            }
        }

