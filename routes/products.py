import base64
from app import app, db
from flask import request, render_template
from models.products import Product

@app.route('/add-product', methods=['POST','GET'])
def add_product():
    def image_decode(object):
        """Этот код преобразует изображение, хранящееся в переменной product.image, в строку, закодированную с помощью Base64. Затем строка, полученная в результате этого кодирования, декодируется с использованием UTF-8."""
        return base64.b64encode(object).decode('utf-8') 
    
    if request.method == 'POST':

        name = request.form['name']
        price = request.form['price']
        weight = request.form['weight']
        image = request.files['image'].read()
        category = request.form['category']
        composition = request.form.get('composition')
        calorie_count = request.form.get('calorie_count')

        product = Product(name=name, price=price, weight=weight, image=image,
                          category=category, composition=composition,
                          calorie_count=calorie_count)

        db.session.add(product)
        db.session.commit()
    
    products = db.session.query(Product).all()
    for product in products:
        product.image = image_decode(product.image)
    
    return render_template(
        'add_product.html',
        products=products
        )