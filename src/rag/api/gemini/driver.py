import os
import json
import dotenv
import google.generativeai as genai

from rag.utils import jsonify_dataset
from rag.api.gemini.prompt import prompt

dotenv.load_dotenv()
genai.configure(api_key=os.environ["GOOGLE_AI_API_KEY"])

MODEL_TYPE = "gemini-1.5-flash"
DATA_PATH = 'data/'
MEGY_DATA_PATH = DATA_PATH + "megy_clean_synthesis.csv"


def get_available_models():
    i = 0
    for model in genai.list_models():
        if 'generateContent' in model.supported_generation_methods:
            print(f'{i+1}:', model.name)
            i += 1


def instantiate_model():
    return genai.GenerativeModel(MODEL_TYPE)


def start_chat(model: genai.GenerativeModel, prompt: str = prompt, data_fp: str = MEGY_DATA_PATH) -> genai.ChatSession:
    data = json.dumps(jsonify_dataset(data_fp), ensure_ascii=False)
    starting_message = f"{prompt} \n {data}"
    chat = model.start_chat(
        history=[
            {
                'role': 'user',
                'parts': starting_message
            }
        ]
    )
    return chat


def ask_model(chat: genai.ChatSession, query: str) -> str:
    resp = chat.send_message(query)
    return resp.text


if __name__ == '__main__':
    model = instantiate_model()
    chat = start_chat(model, prompt, DATA_PATH + 'megy_clean_synthesis.csv')

    test_query = "Plan synthesis for material with sat_em_g = 52.15, mr(emu/g) = 13.76, coer_oe = 27800"

    resp = ask_model(chat, test_query)
    print(resp)