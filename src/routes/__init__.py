from fastapi import FastAPI
from src.routes.health_check import router as router_health_check


def init_app_routes(app: FastAPI) -> None:
    """Starts the app's routes."""
    app.include_router(router_health_check)

