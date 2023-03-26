from flask import Flask
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()

def create_app(config_object_name):
    from routes.return_product_data import product_data
    from routes.user_session import user_session
    from models.entities.carts import Cart
    from models.entities.products import Product
    from models.entities.products_in_cart import ProductsInCart
    from models.entities.users import User
    
    app = Flask(__name__, template_folder='templates', static_folder='static')
    app.config.from_object(config_object_name)

    app.register_blueprint(product_data)    
    app.register_blueprint(user_session)
    
    db.init_app(app)
    migrate = Migrate(app, db)

    return app
    