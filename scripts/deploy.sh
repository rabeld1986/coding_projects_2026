#!/bin/bash
set -euo pipefail

ENVIRONMENT="${1:-dev}"
APP_NAME="${APP_NAME:-fastapi-app}"

echo "Deploying ${APP_NAME} to ${ENVIRONMENT}"

# Start the FastAPI app locally for demonstration purposes.
mkdir -p logs
nohup python3 -m uvicorn app.main:app --host 0.0.0.0 --port 8000 > "logs/${APP_NAME}.log" 2>&1 &

echo "FastAPI app started on http://localhost:8000"
