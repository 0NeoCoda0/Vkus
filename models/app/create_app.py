#Здесь используется создаение фабрики приложений для тестирования обработчиков
from flask import Flask

def create_app(config_object):
    """
    Эта функция использует объект конфигурации из файла config_app.py
    """
    app = Flask(__name__)
    app.config.from_object(config_object)
    
    return app