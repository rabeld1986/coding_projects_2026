from fastapi import FastAPI

app = FastAPI(title="Simple FastAPI App")


@app.get("/")
def read_root():
    return {"message": "Hello from FastAPI"}
