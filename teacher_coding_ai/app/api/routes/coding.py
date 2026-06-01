from fastapi import (
    APIRouter,
    HTTPException,
)

from app.schemas.coding import (
    CodingRequest,
    CodingResponse,
)

from app.services.coding_service import (
    ask_coding_ai,
)

router = APIRouter()


@router.post(
    "/ask",
    response_model=CodingResponse,
)
def ask_coding(
    data: CodingRequest,
):

    try:

        result = ask_coding_ai(
            data.language,
            data.problem,
        )

        return CodingResponse(
            success=True,
            response=result,
        )

    except Exception as e:

        raise HTTPException(
            status_code=500,
            detail=str(e),
        )