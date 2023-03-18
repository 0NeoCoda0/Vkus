from flask import Blueprint, jsonify, session, request, redirect, url_for, flash
from sqlalchemy.orm import sessionmaker

user_session = Blueprint('user_session', __name__, url_prefix='/user')


@user_session.route('/new', methods=['POST'])
def new_user_session():
    session['user_ip'] = {
        'real': request.remote_addr,
        'proxy': request.access_route[-1]
    }
    flash(session['user_ip'])
    return redirect(url_for('hot_menu_page'))
