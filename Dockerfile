ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION}-buster as base

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

RUN pip install --upgrade pip
RUN pip install poetry

COPY . /tiny-grocery 

WORKDIR /tiny-grocery

RUN poetry install

EXPOSE 8000

CMD ["poetry", "run", "gunicorn", "src.app:create_app", "-w", "4", "-k", "uvicorn.workers.UvicornWorker"]
