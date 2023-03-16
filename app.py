from flask import Flask, render_template
from routes.return_product_data import product_data
from models.db_requests import get_data

app = Flask(__name__)
app.config['SECRET_KEY'] = 'mysecretkey'
app.register_blueprint(product_data)

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/hot-menu')
def hot_menu_page():
    categories = []
    products = get_data('hot-food')
    for product in products:
        if product.category not in categories:
            categories.append(product.category)

    return render_template(
        'menu-pages.html',
        products=products,
        categories=categories
    )


@app.route('/freeze-menu')
def freeze_food_page():
    categories = []
    products = get_data('freeze-food')
    for product in products:
        if product.category not in categories:
            categories.append(product.category)

    return render_template(
        'freeze.html',
        products=products,
        categories=categories
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