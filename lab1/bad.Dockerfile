FROM --platform=linux/amd64 python:latest

ENV TZ=Europe/Moscow
ENV PYTHONDONTWRITEBYTECODE=1

RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get install -y wget

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda

ENV PATH=/opt/conda/bin:$PATH

WORKDIR /app

COPY ./bad-environment.yaml .

RUN conda init

RUN conda install -c https://repo.prefix.dev/conda-forge libgfortran

RUN conda env update --file bad-environment.yaml 

COPY ./src /app/src

ENV GOOGLE_AI_API_KEY=$GOOGLE_AI_API_KEY
ENV OPENAI_API_KEY=$OPENAI_API_KEY

WORKDIR /app/src

ENV PYTHONPATH=/app/src

CMD ["bash", "-c", "python main.py"]
