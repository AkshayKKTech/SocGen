pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.10'
            args  '--entrypoint=' 
        }
    }
    
    environment {
        // Fixed: pluralized 'credentials' and used standard AWS env variable names
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    
    stages {
        stage('Checkout SCM') {
            steps {
                // Fixed: Running it as an official Jenkins DSL method, not a shell script
                checkout scm
            }
        }
        
        stage('Terraform Init') {
            steps {
                echo "Initializing..."
                sh "terraform init"
            }
        }
        
        stage('Terraform Plan') {
            steps {
                echo "Planning steps..."
                sh "terraform plan -out=tfplan"
            }
        }
        
        stage('Terraform Apply') {
            steps {
                echo "Applying configuration..."
                // Fixed: Added the missing closing quote at the end
                sh "terraform apply -auto-approve tfplan"
            }
        }
    }
} // Fixed: Added the missing closing brace for the pipeline block
