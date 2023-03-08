import base64
from flask import Flask, request
from flask import render_template
from flask_sqlalchemy import SQLAlchemy
from models.products import Product

login_data = 'postgresql://neocoda:grand_user@localhost/vkus'

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = login_data
db = SQLAlchemy(app)


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/hot-menu')
def hot_menu_page():
    return render_template('menu-pages.html')

@app.route('/freeze-menu')
def freeze_food_page():
    return render_template('freeze.html')

@app.route('/keitering')
def keitering_page():
    return render_template('keitering.html')

@app.route('/contacts')
def contacts_page():
    return render_template('contacts.html')

@app.route('/bucket')
def bucket_page():
    return render_template('bucket.html')