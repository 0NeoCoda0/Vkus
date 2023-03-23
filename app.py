from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

def create_app(config_object_name):
    from routes.return_product_data import product_data
    from routes.user_session import user_session
    
    app = Flask(__name__, template_folder='templates', static_folder='static')
    app.config.from_object(config_object_name)

    app.register_blueprint(product_data)    
    app.register_blueprint(user_session)

    db.init_app(app)

    with app.app_context():
        db.create_all()
    return app
