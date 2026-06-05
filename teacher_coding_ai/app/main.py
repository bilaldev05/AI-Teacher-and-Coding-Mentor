from fastapi import FastAPI

from fastapi.middleware.cors import (
    CORSMiddleware,
)

from app.api.routes.teacher import (
    router as teacher_router,
)

from app.api.routes.coding import (
    router as coding_router,
)

app = FastAPI(
    title="AI Teacher & Coding Mentor",
)


app.add_middleware(
    CORSMiddleware,

    allow_origins=["*"],

    allow_credentials=True,

    allow_methods=["*"],

    allow_headers=["*"],
)




app.include_router(
    teacher_router,

    prefix="/api/v1/teacher",

    tags=["Teacher Assistant"],
)

app.include_router(
    coding_router,

    prefix="/api/v1/coding",

    tags=["Coding Mentor"],
)


@app.get("/")
def root():

    return {
        "message":
        "AI Teacher & Coding Mentor Running"
    }


# python -m uvicorn app.main:app  --reload