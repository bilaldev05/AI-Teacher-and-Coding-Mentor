from pydantic import BaseModel


class TeacherRequest(BaseModel):
    subject: str
    question: str


class TeacherResponse(BaseModel):
    success: bool
    response: str