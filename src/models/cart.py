from typing import Optional
from sqlmodel import SQLModel, Field, Relationship
from src.models.item import Item


class Cart(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    user_id: int = Field(foreign_key="user.id")
    items: list[Item] = Relationship(back_populates="cart")
