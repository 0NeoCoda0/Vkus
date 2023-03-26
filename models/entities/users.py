from sqlalchemy import Column, Integer,  String

from create_app import db


class User(db.Model):
    __tablename__ = "users"
    user_id = Column(Integer, primary_key=True, autoincrement=True)
    cart_id = Column(Integer)
    nick_name = Column(String(50), nullable=False)
    first_name = Column(String(50))
    last_name = Column(String(50))
    password = Column(String(50), nullable=False)
    mail = Column(String(50))
    delivery_adress = Column(String(255))
    phone = Column(String(30))

    def update(self, data):
        for key, value in data.items():
            if hasattr(self, key):
                setattr(self, key, value)
        db.session.commit()
