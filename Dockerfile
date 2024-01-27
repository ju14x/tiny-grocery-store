ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION}-buster as base

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

RUN pip install --upgrade pip && pip install poetry

COPY . /tiny-grocery 

WORKDIR /tiny-grocery

RUN poetry install --no-dev --no-root

CMD uvicorn --factory src.app:create_app
