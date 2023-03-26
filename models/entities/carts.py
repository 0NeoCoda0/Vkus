import datetime

from sqlalchemy import ARRAY, Column, DateTime, Integer, Numeric, String

from create_app import db


class Cart(db.Model):
    __tablename__ = "carts"
    cart_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer)
    order_price = Column(Numeric(10, 2))
    delivery_duration = Column(Numeric(10))
    creation_date = Column(DateTime, default=datetime.datetime.utcnow)
    delivery_date = Column(DateTime)

    def update(self, data):
        '''Метод обновляет только переданные в словаре значения столбцов'''
        for key, value in data.items():
            if hasattr(self, key):
                setattr(self, key, value)
        db.session.commit()

    def set_delivery_date(self):
        '''Метод устанавливает текущую дату. 
        Его нужно вызывать, когда доставщик принес заказ по адресу доставки'''
        self.delivery_date = datetime.datetime.utcnow
        db.session.commit()
