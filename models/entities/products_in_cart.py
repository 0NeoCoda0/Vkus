from sqlalchemy import Column, Integer

from create_app import db

class ProductsInCart(db.Model):
    __tablename__ = "products_in_cart"
    id = Column(Integer, primary_key=True, autoincrement=True)
    product_id = Column(Integer)
    cart_id = Column(Integer)
    quantity = Column(Integer)

    # Пользовать может удалить товар из корзины
    def delete_product(self, product_id):
        product_to_delete = db.session.query(ProductsInCart).filter_by(product_id=product_id).first()
        if product_to_delete is not None:
            db.session.delete(product_to_delete)
        else:
            pass
    # Пользователь может увеличить количество товара в корзине
    # Пользовать может уменьшить количество товара в корзине
    # Пользовать может добавить товар в корзину