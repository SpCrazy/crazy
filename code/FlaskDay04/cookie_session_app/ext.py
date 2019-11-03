from flask_session import Session

s = Session()   #创建Session对象，该对象可以提供Session的服务端存储

def init_ext(app):
    s.init_app(app) #关联Session对象与程序实例