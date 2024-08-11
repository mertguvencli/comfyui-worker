from pydantic import BaseModel


class Input(BaseModel):
    uid: str | None = None
    workflow: dict
