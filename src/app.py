from fastapi import FastAPI

app = FastAPI(title='tiny grocery store')

@app.get('/')
def home():
    return {'!'}

