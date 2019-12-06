from django.core.cache import cache
from rest_framework.authentication import BaseAuthentication

from user.models import XiaomiUser
from util.error import XiaomiException


class UserTokenAuthentication(BaseAuthentication):
    def authenticate(self,request):
        try:
            token = request.data.get("token") if request.data.get("token")  else request.query_params.get("token")
            user_id = cache.get(token)
            user = XiaomiUser.objects.get(pk=user_id)
            return (user,token)   # 自动赋值：request.user = user 和 request.auth = token
        except:
            raise XiaomiException({"code":3000,"msg":"您还未登录，请先登录"})