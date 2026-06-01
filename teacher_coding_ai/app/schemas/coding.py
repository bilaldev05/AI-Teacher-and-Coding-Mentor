from pydantic import BaseModel


class CodingRequest(BaseModel):
    language: str
    problem: str


class CodingResponse(BaseModel):
    success: bool
    response: str