import requests

from app.core.config import (
    LM_STUDIO_URL,
    MODEL_NAME,
)

from app.utils.prompts import (
    build_coding_prompt,
)


def ask_coding_ai(
    language: str,
    problem: str,
) -> str:

    prompt = build_coding_prompt(
        language,
        problem,
    )

    payload = {

        "model": MODEL_NAME,

        "messages": [
            {
                "role": "user",
                "content": prompt
            }
        ],

        "temperature": 0.3,

        "max_tokens": 300,
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