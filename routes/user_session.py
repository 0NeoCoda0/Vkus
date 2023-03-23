from flask import Blueprint, session, redirect, url_for, flash
from models.db_requests import get_product_info


user_session = Blueprint('user_session', __name__, url_prefix='/user')


@user_session.route('/new', methods=['POST'])
def new_user_session():
    session['user_name'] = 'anon'
    flash(session['user_name'])
    return redirect(url_for('menu_page', type='hot-food'))

@user_session.route('/add_product/<id>/<type>', methods=['POST'])
def add_product(id, type):
    return redirect(url_for('menu_page', type=type))
