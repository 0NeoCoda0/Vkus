from models.entities.products import Product
from create_app import db

def get_product_type(type):
    products = db.session.query(Product).filter_by(type=type).all()
    return products


def get_product_list(category):
    product_list = db.session.query(Product).filter_by(category=category).all()
    return product_list

def get_product_info(id):
    product = db.session.get(Product, id)

    product_list = {
        'name': product.name,
        'price': product.price,
        'weight': product.weight,
        'quantity': product.quantity,
        'image': product.image,
        'category': product.category,
        'composition': product.composition,
        'calories': product.calories
    }
    return product_list
