from pathlib import Path
import mimetypes
import time
from comfyui import ComfyUI
from fastapi import FastAPI
from pydantic import BaseModel
from logger import logger
from s3 import S3

DEFAULT_CONTENT_TYPE = "image/webp"
OUTPUT_DIR = "/tmp/outputs"
INPUT_DIR = "/tmp/inputs"
COMFYUI_TEMP_OUTPUT_DIR = "ComfyUI/temp"
ALL_DIRECTORIES = [OUTPUT_DIR, INPUT_DIR, COMFYUI_TEMP_OUTPUT_DIR]
EXAMPLE_WORKFLOW_JSON = Path('constants/reset.json').read_text()

mimetypes.add_type(DEFAULT_CONTENT_TYPE, ".webp")
comfyui = ComfyUI("127.0.0.1:8188")
comfyui.start_server(OUTPUT_DIR, INPUT_DIR)
app = FastAPI()


class Input(BaseModel):
    uid: str | None = None
    workflow: dict


@app.post("/inference")
def inference(
    input: Input,
):
    execution_metrics = {}
    t0 = time.time()
    s0 = t0
    logger.info('Inference has started!')
    comfyui.cleanup(ALL_DIRECTORIES)
    wf = comfyui.load_workflow(
        input.workflow
    )
    comfyui.connect()
    comfyui.run_workflow(wf)
    execution_metrics.update({"comfyui": round(time.time() - t0, 3)})

    t0 = time.time()
    s3 = S3()
    image_urls = []

    for ix, file in enumerate(comfyui.get_files(OUTPUT_DIR), 1):
        prefix = f'{input.uid}/{ix}.webp'
        s3.upload(prefix=prefix, file=file, content_type=DEFAULT_CONTENT_TYPE)
        image_urls.append(s3.get_presigned_url(prefix=prefix))

    execution_metrics.update({"s3": round(time.time() - t0, 3)})
    execution_metrics.update({"total": round(time.time() - s0, 3)})

    return {
        "uid": input.uid,
        "execution_metrics_ms": execution_metrics,
        "image_urls": image_urls,
    }
