SRC_DIR := src
TEST_DIR := tests
PORT := 8000

.PHONY: install run run-dev test format

install:
	poetry install

run:
	gunicorn $(SRC_DIR).app:create_app -w 4 -k uvicorn.workers.UvicornWorker

run-dev:
	uvicorn --factory $(SRC_DIR).app:create_app --host 0.0.0.0 --port $(PORT) --reload

test:
	poetry run pytest $(TEST_DIR) --cov=$(SRC_DIR) --cov-report=term-missing
