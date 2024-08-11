import os
from typing import Any
import boto3
from config import settings


class S3:
    def __init__(self, bucket: str = settings.AWS_S3_BUCKET) -> None:
        self.bucket = bucket
        self.session = boto3.Session(
            aws_access_key_id=settings.AWS_ACCESS_KEY,
            aws_secret_access_key=settings.AWS_SECRET_ACCESS,
            region_name=settings.AWS_S3_REGION,
        )
        self.client = self.session.client(service_name='s3')

    def upload(self, *, prefix: str, file: Any, content_type: str) -> None:
        if isinstance(file, str):
            if not os.path.exists(file):
                raise ValueError('File does not exist!')

            self.client.put_object(
                ContentType=content_type,
                Body=open(file, 'rb'),
                Bucket=self.bucket,
                Key=prefix,
            )
        else:
            self.client.put_object(
                ContentType=content_type,
                Body=file,
                Bucket=self.bucket,
                Key=prefix,
            )

    def get_presigned_url(self, prefix, expires_in=3600) -> str:
        return self.client.generate_presigned_url(
            'get_object',
            Params={'Bucket': self.bucket,
                    'Key': prefix},
            ExpiresIn=expires_in
        )
