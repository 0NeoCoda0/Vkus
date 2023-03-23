from sqlalchemy import Column, Integer, String, Numeric, LargeBinary, ARRAY
from sqlalchemy.orm import declarative_base 

Base = declarative_base()

class Product(Base):
    __tablename__ = 'products'
    product_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    price = Column(Numeric(10, 2), nullable=False)
    weight = Column(Numeric(10, 2))
    quantity = Column(Integer)
    image = Column(String(255))
    category = Column(String(255), nullable=False)
    type = Column(String(255), nullable=False)
    composition = Column(ARRAY(String))
    calories = Column(Integer)