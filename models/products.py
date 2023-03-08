from sqlalchemy import Column, Integer, String, Numeric, LargeBinary, ARRAY
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Product(Base):
    __tablename__ = 'products'
    product_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    price = Column(Numeric(10, 2), nullable=False)
    weight = Column(Numeric(10, 2))
    quantity = Column(Integer)
    image = Column(LargeBinary)
    category = Column(String(255), nullable=False)
    composition = Column(ARRAY(String))
    calories = Column(Integer)