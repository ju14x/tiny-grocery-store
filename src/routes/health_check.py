from fastapi import APIRouter

router = APIRouter()


@router.get('/status', tags=['Health Check'])
def check_health():
    """Checks the app's current status."""
    return 'ok!'
