from typing import Optional
from sqlmodel import SQLModel, Field

from src.models.cart import Cart


class Item(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    name: str
    price: float
    available_quantity: int
    cart: Optional[Cart] = Field(default=None, foreign_key="cart.id")
