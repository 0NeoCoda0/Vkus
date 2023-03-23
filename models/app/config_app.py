class Config(object):
    DEBUG = False
    TESTING = False

class TestingConfig(Config):
    TESTING = True

class DevelopmentConfig(Config):
    DEBUG = True