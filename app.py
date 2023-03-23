from flask import Flask, render_template
from routes.return_product_data import product_data
from routes.user_session import user_session
from models.db_requests import get_product_type, get_product_list


app = Flask(__name__)
app.config['SECRET_KEY'] = 'civ3i4l5i6a7z1t3i31#$%41nner2'
app.register_blueprint(product_data)
app.register_blueprint(user_session)


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

'''
@app.route('/menu/<type>')
def menu_page(type):
    #Получение и формирование списка категорий
    categories = []
    products = get_data(type)
    for product in products:
        if product.category not in categories:
            categories.append(product.category)
    
    #Сериализация данных о продуктах в выбранной категории
    choosen_category = request.args.get('category')
    product_list = get_product_list(choosen_category)

    return render_template(
        f'{type}.html',
        products=product_list,
        categories=categories,
        type=type
    )
'''