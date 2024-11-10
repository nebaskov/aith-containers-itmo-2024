FROM mambaorg/micromamba:1.5.10

ENV TZ=Europe/Moscow
ENV PYTHONDONTWRITEBYTECODE=1

RUN mkdir /home/mambauser/eggnog

COPY --chown=$MAMBA_USER:$MAMBA_USER ./environment.yaml /tmp/env.yaml
ARG MAMBA_DOCKERFILE_ACTIVATE=1

RUN micromamba install -c https://repo.prefix.dev/conda-forge libgfortran

RUN micromamba install -y --file env.yaml && \
    micromamba clean --all --yes

COPY ./src /app/src
COPY --chown=$MAMBA_USER:$MAMBA_USER ./entrypoint.sh /app/entrypoint.sh

WORKDIR /app/src

ENTRYPOINT [ "/app/entrypoint.sh" ]
