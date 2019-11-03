import redis
from flask import request, g

r = redis.Redis(host='localhost',port=6379,password='123')

def load_middleware(app):

    @app.before_request
    def a():
        ip = request.remote_addr
        key = "limit:" + ip
        is_ok = r.set(key,1,ex=60,nx=True)
        if is_ok or r.incr(key) <=5:
            g.visit_count = r.get(key).decode()
        else:
            return "<h3 style='color:red'>访问次数过于频繁，请稍后再试</h3>"