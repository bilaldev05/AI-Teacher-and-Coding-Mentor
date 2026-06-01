import requests

from app.core.config import (
    LM_STUDIO_URL,
    MODEL_NAME,
)

from app.utils.prompts import (
    build_teacher_prompt,
)


def ask_teacher_ai(
    subject: str,
    question: str,
) -> str:

    prompt = build_teacher_prompt(
        subject,
        question,
    )

    payload = {

        "model": MODEL_NAME,

        "messages": [
            {
                "role": "user",
                "content": prompt
            }
        ],

        "temperature": 0.4,

        "max_tokens": 250,
    }

    response = requests.post(
        LM_STUDIO_URL,
        json=payload,
        timeout=300,
    )

    result = response.json()

    return result["choices"][0][
        "message"
    ]["content"]