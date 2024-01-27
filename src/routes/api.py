from fastapi import APIRouter

router = APIRouter()


@router.post('/items/{item_name}/{quantity}', tags=['Items'])
def add_item(item_name: str, quantity: int):
    """Adds an item to the cart."""
    return {'item': item_name, 'quantity': quantity}
