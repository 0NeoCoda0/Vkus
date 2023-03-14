from flask import Blueprint, jsonify
from sqlalchemy.orm import sessionmaker

from models.db_requests import engine
from models.products import Product


Session = sessionmaker(bind=engine)
session = Session()

product_data = Blueprint('product_data', __name__, url_prefix='/product')

@product_data.route('/<product_id>')
def return_product_data(product_id):
    """
    Функция возвращает список параметров продукта по запрошенному идентификатору.
    """
    product = session.query(Product).get(product_id)
    product_info = {
        'name': product.name,  
        'price': product.price,
        'weight': product.weight,
        'quantity': product.quantity,
        'image': product.image,
        'category': product.category,
        'composition': product.composition,
        'calories': product.calories
    }
    return jsonify(product_info)