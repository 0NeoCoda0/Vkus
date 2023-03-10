from flask import Blueprint, render_template
from flask_wtf import FlaskForm
from wtforms import StringField, DecimalField, IntegerField
from wtforms.validators import DataRequired
from models.products import Product
from models.db_requests import engine
from sqlalchemy.orm import sessionmaker

Session = sessionmaker(bind=engine)
session = Session()

bp_card_edit = Blueprint('card_edit', __name__, url_prefix='/card', static_folder='../static')

class ProductForm(FlaskForm):
    name = StringField('Name', validators=[DataRequired()])
    price = DecimalField('Price', validators=[DataRequired()])
    weight = DecimalField('Weight')
    quantity = IntegerField('Quantity')
    image = StringField('Image')
    category = StringField('Category', validators=[DataRequired()])
    type = StringField('Type', validators=[DataRequired()])
    composition = StringField('Composition')
    calories = IntegerField('Calories')

@bp_card_edit.route('/edit/<int:product_id>', methods=['GET','POST'])
def card_edit(product_id):
    product = session.query(Product).get(product_id)
    form = ProductForm(obj=product)

    categories = session.query(Product.category).distinct().order_by(Product.category).all()
    names = session.query(Product.name).distinct().order_by(Product.name).all()

    if form.validate_on_submit():
        form.populate_obj(product)
        print('WORK!')
        session.commit()
    return render_template('edit_product.html', form=form)
