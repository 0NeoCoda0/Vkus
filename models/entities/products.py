from sqlalchemy import ARRAY, Column, Integer, Numeric, String

from create_app import db


class Product(db.Model):
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

    def update(self, data):
        for key, value in data.items():
            if hasattr(self, key):
                setattr(self, key, value)
        db.session.commit()

    def some_test_func(self):
        pass
