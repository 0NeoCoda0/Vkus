from models.db_requests import get_product_info

def test_get_product_info(product_id):
    
    assert get_product_info(product_id) == {
        'name': 'ракушки',
        'price': 600.00,
        'weight': None,
        'quantity': None,
        'image': 'static/images/menu/freeze/ракушки с мясом.jpg',
        'category': 'ГАЛУШКИ',
        'composition': None,
        'calories': None
    }
    
