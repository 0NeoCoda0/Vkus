from sqlalchemy.orm import sessionmaker
from models.products import Product
from sqlalchemy import create_engine

engine = create_engine('postgresql://neocoda:grand_user@localhost/vkus')
Session = sessionmaker(bind=engine)
session = Session()

def get_data(type):
    products = session.query(Product).filter_by(type=type).all()
    return products

def get_product_list(category):
    product_list = session.query(Product).filter_by(category=category).all()
    return product_list