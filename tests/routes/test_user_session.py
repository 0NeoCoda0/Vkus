from routes.user_session import add_product
from app import app


def test_add_product():
    test_session = {}
    product_id = 3
    type = 'freeze-food'
    with app.app_context():
        test_session['cart'] = add_product(product_id, type)
    assert test_session['cart'] == {
        3 : {
        'count': 1,
        'name': 'ракушки',
        'price': 600.00,
        'weight': None,
        'quantity': None,
        'image': 'static/images/menu/freeze/ракушки с мясом.jpg',
        'category': 'ГАЛУШКИ',
        'composition': None,
        'calories': None
        }
    }
    with app.app_context():
        
        test_session['cart'] = add_product(product_id, type)
    assert test_session['cart'] == {
        3 : {
        'count': 2,
        'name': 'ракушки',
        'price': 600.00,
        'weight': None,
        'quantity': None,
        'image': 'static/images/menu/freeze/ракушки с мясом.jpg',
        'category': 'ГАЛУШКИ',
        'composition': None,
        'calories': None
        }
    }
