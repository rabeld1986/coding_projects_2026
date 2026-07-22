# coding_projects_2026

## FastAPI app with Jenkins deployment

This project now contains a simple FastAPI application plus a Jenkins pipeline that can build, test, and start it.

### Project files
- [app/main.py](app/main.py) — FastAPI app entry point
- [tests/test_app.py](tests/test_app.py) — basic endpoint test
- [requirements.txt](requirements.txt) — Python dependencies
- [Jenkinsfile](Jenkinsfile) — declarative pipeline for install, test, and deploy
- [scripts/deploy.sh](scripts/deploy.sh) — script that starts the app locally

### Local run
```bash
python3 -m pip install -r requirements.txt
python3 -m pytest -q
python3 -m uvicorn app.main:app --host 127.0.0.1 --port 8000
```

### Verify locally
Open http://127.0.0.1:8000/ and you should see:
```json
{"message":"Hello from FastAPI"}
```

### Jenkins usage
1. Create a new Jenkins pipeline job and point it to this repository.
2. Use the included Jenkinsfile as the pipeline definition.
3. Set the environment and enable deployment when you want the deploy stage to run.
4. Push changes to the repository to trigger a new build automatically if webhook or polling is configured.

# Triggered at 2026-07-21 20:22:10

# Triggered at 2026-07-22 00:45:00
