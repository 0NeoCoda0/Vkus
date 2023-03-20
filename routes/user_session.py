from flask import Blueprint, jsonify, session, request, redirect, url_for, flash
from sqlalchemy.orm import sessionmaker

user_session = Blueprint('user_session', __name__, url_prefix='/user')


@user_session.route('/new', methods=['POST'])
def new_user_session():
    session['user_name'] = 'anon'
    flash(session['user_name'])
    return redirect(url_for('menu_page', type='hot-food'))

@user_session.route('/add_product/<id>')
def add_product(id):
    pass
