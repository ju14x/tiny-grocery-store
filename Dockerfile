ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION}-buster as base

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

RUN pip install --upgrade pip && pip install poetry

COPY . /tiny-grocery 

WORKDIR /tiny-grocery

RUN poetry install --no-root --only main

EXPOSE 8000

CMD poetry run uvicorn src.app:create_app --host 0.0.0.0 --port $PORT
