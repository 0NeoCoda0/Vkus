from sqlalchemy.orm import sessionmaker
from models.products import Product
from sqlalchemy import create_engine

engine = create_engine('postgresql://neocoda:grand_user@localhost/vkus')

def get_data(type):
    Session = sessionmaker(bind=engine)
    session = Session()
    products = session.query(Product).filter_by(type=type).all()
    return products