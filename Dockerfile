ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION}-buster as base

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

RUN pip install --upgrade pip && pip install poetry

COPY . /tiny-grocery 

WORKDIR /tiny-grocery

RUN poetry install --no-root --only main

EXPOSE 8000

CMD poetry run gunicorn src.app:create_app -w 4 -k uvicorn.workers.UvicornWorker --bind 0.0.0.0 --proxy-headers
