pipeline {
  agent any

  parameters {
    choice(
      name: 'ENVIRONMENT',
      choices: ['dev', 'staging', 'prod'],
      description: 'Target deployment environment'
    )
    booleanParam(
      name: 'DEPLOY_ENABLED',
      defaultValue: false,
      description: 'Enable the deployment stage'
    )
  }

  environment {
    APP_NAME = 'fastapi-app'
    DEPLOY_SCRIPT = 'scripts/deploy.sh'
  }

  stages {
    stage('Checkout') {
      steps {
        echo "=================================================="
        echo "STAGE: Checkout"
        echo "Checking out source for ${env.APP_NAME}"
        checkout scm
      }
    }

    stage('Install dependencies') {
      steps {
        echo "=================================================="
        echo "STAGE: Install dependencies"
        sh '''
          python3 -m pip install --user -r requirements.txt
        '''
      }
    }

    stage('Test') {
      steps {
        echo "=================================================="
        echo "STAGE: Test"
        sh '''
          python3 -m pytest -q
        '''
      }
    }

    stage('Deploy') {
      when {
        expression { return params.DEPLOY_ENABLED }
      }
      steps {
        echo "=================================================="
        echo "STAGE: Deploy"
        echo "Deploying ${env.APP_NAME} to ${params.ENVIRONMENT}"
        sh "chmod +x ${env.DEPLOY_SCRIPT} && ./${env.DEPLOY_SCRIPT} '${params.ENVIRONMENT}'"
      }
    }
  }

  post {
    always {
      echo 'Pipeline finished.'
    }
    success {
      echo 'FastAPI pipeline completed successfully.'
    }
    failure {
      echo 'Pipeline failed. Check the Jenkins logs for details.'
    }
  }
}
