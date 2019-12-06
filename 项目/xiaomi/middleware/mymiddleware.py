import threading

import redis
from django.utils.deprecation import MiddlewareMixin
from rest_framework.response import Response



lock = threading.Lock()
class FirstMiddleware(MiddlewareMixin):
    lock.acquire()
    def process_request(self,request):
        ip = request.META.get("REMOTE_ADDR")   # 获取当前请求的IP地址
        r = redis.Redis(host="localhost",port=6379,db=0)
        key = "limit:" + ip
        is_ok = r.set(key,1,ex=60,nx=True)   # 只有当key不存在的时候。set命令才能执行，key的过期时间为5秒
        if is_ok or r.incr(key) > 5:
            result = {
                "code":400,
                "msg":"您的访问过于频繁，请稍后再试"
            }
            lock.release()
            return Response(result)