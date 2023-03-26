from flask import Blueprint, jsonify, redirect, url_for
from create_app import db 
from models.entities.products import Product

product_data = Blueprint('product_data', __name__, url_prefix='/product')

@product_data.route('/<product_id>')
def return_product_data(product_id):
    """
    Функция возвращает список параметров продукта по запрошенному идентификатору.
    """
    product = db.session.query(Product).get(product_id)
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

@product_data.route('/list/<category>/<type>')
def return_product_list(category, type):
    return redirect(url_for('menu_page', category=category, type=type))