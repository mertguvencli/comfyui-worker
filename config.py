from os import getenv
from pydantic import BaseModel
from dotenv import load_dotenv
load_dotenv()


class Settings(BaseModel):
    AWS_ACCESS_KEY: str = getenv('AWS_ACCESS_KEY')
    AWS_SECRET_ACCESS: str = getenv('AWS_SECRET_ACCESS')
    AWS_S3_REGION: str = getenv('AWS_S3_REGION')
    AWS_S3_BUCKET: str = getenv('AWS_S3_BUCKET')


settings = Settings()
