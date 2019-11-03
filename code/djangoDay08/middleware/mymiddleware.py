from django.shortcuts import redirect
from django.urls import reverse
from django.utils.deprecation import MiddlewareMixin

LOGIN_REQUIRED = ["/homework/fruit/buy/","/homework/fruit/cart/"]

class LoginMiddleware(MiddlewareMixin):

    def process_request(self,request):
        reqpath = request.path
        print(reqpath)
        if reqpath in LOGIN_REQUIRED:
            if not request.user.is_authenticated:
                return redirect(reverse("homework:log"))
