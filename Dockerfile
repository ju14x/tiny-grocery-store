ARG PYTHON_VERSION=3.11.3
FROM python:${PYTHON_VERSION}-slim as base

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

RUN pip install poetry

COPY . /tiny-grocery 

WORKDIR /tiny-grocery

RUN poetry install

CMD ["uvicorn", "src.app:create_app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

EXPOSE 8000
