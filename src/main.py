import uvicorn
from fastapi import FastAPI
from schemas import (
    MegSynthQuery,
    MegSynthResponse,
)
from rag.api import gemini

app = FastAPI()


@app.post("/query_meg_synthesis")
def ask_model(query: MegSynthQuery) -> MegSynthResponse:
    model = gemini.instantiate_model()
    chat = gemini.start_chat(model)
    response = gemini.ask_model(chat, query.query)
    return MegSynthResponse(response=response)


@app.get("/health")
async def health():
    return {200: 'ok'}


if __name__ == '__main__':
    uvicorn.run('main:app', host='0.0.0.0', port=8000, reload=True)
