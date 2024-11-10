from pydantic import BaseModel


class MegSynthQuery(BaseModel):
    query: str


class MegSynthResponse(BaseModel):
    response: str
