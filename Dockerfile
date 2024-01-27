ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION}-buster as base

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

RUN pip install --upgrade pip && pip install poetry

COPY . /tiny-grocery 

WORKDIR /tiny-grocery

RUN poetry install --no-dev

EXPOSE 7267

CMD poetry run gunicorn src.app:create_app --host 0.0.0.0 --port 7267 -w 2 -k uvicorn.workers.UvicornWorker --factory
