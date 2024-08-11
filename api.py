from fastapi import FastAPI
from _types import Input
from worker import make_inference

app = FastAPI()


@app.post("/inference")
def inference(input: Input):
    return make_inference(input)
