import pytest
from config_app import TestingConfig
from create_app import create_app

@pytest.fixture()
def app():
    app = create_app(TestingConfig)
    yield app

@pytest.fixture()
def client(app):
    return app.test_client()

def test_add_product(client):
    product_id = 3
    food_type = 'freeze-food'
    with client.session_transaction() as session:
        session['cart'] = {}
        client.post(f"/add_product/{product_id}/{food_type}")
        assert session['cart'] == {
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

        client.post(f"/add_product/{product_id}/{food_type}")
        assert session['cart'] == {
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
