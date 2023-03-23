from flask import render_template
from models.db_requests import get_product_type
from app import create_app
from config_app import Config

app = create_app(Config)

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/menu/<type>')
def menu_page(type):
    #Получение и формирование списка категорий
    categories = []
    products = get_product_type(type)
    for product in products:
        if product.category not in categories:
            categories.append(product.category)

    return render_template(
        f'{type}.html',
        products=products,
        categories=categories,
        type=type
    )

@app.route('/keitering')
def keitering_page():
    return render_template('keitering.html')


@app.route('/contacts')
def contacts_page():
    return render_template('contacts.html')


@app.route('/bucket')
def bucket_page():
    return render_template('bucket.html')

@app.route('/.well-kwown/acme-challenge')
def validate_sertificate():
    return render_template('WET_j_juABSRwmEvWDydVQ1cVqlBpg5OWUT44tAVRck.html')