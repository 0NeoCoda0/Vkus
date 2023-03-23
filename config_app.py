class Config(object):
    DEBUG = False
    TESTING = False
    SQLALCHEMY_DATABASE_URI = 'postgresql://neocoda:grand_user@localhost/vkus'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = 'civ3i4l5i6a7z1t3i31#$%41nner2'


class TestingConfig(Config):
    TESTING = True

class DevelopmentConfig(Config):
    DEBUG = True