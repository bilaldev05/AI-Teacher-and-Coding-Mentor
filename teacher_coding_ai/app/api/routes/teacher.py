from fastapi import (
    APIRouter,
    HTTPException,
)

from app.schemas.teacher import (
    TeacherRequest,
    TeacherResponse,
)

from app.services.teacher_service import (
    ask_teacher_ai,
)

router = APIRouter()


@router.post(
    "/ask",
    response_model=TeacherResponse,
)
def ask_teacher(
    data: TeacherRequest,
):

    try:

        result = ask_teacher_ai(
            data.subject,
            data.question,
        )

        return TeacherResponse(
            success=True,
            response=result,
        )

    except Exception as e:

        raise HTTPException(
            status_code=500,
            detail=str(e),
        )