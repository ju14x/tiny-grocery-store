from fastapi import FastAPI
from src import routes

app = FastAPI(title='tiny grocery store')


def create_app() -> FastAPI:
    """Creates the FastAPI application."""
    routes.init_app_routes(app)
    return app
