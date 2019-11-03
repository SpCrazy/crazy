import os

from tornado.ioloop import IOLoop
from tornado.web import RequestHandler, Application, url


class CsrfHandler(RequestHandler):
    def get(self, *args, **kwargs):
        self.render("register.html")

    def post(self, *args, **kwargs):
        regname = self.get_body_arguments("regname")
        regpwd = self.get_body_arguments("regpwd")
        print("注册成功，用户名为:",regname,"；密码是:",regpwd)
        return self.redirect(self.reverse_url('suc'))


class SuccessHandler(RequestHandler):
    def get(self, *args, **kwargs):
        self.render("success.html")

settings = {
    "xsrf_cookies":True,
    "template_path":os.path.join(os.getcwd(),"templates"),
    "debug":True,
}

app = Application([
    url(r'/register/',CsrfHandler,name="reg"),
    url(r'/success/',SuccessHandler,name="suc")
],**settings)

app.listen(8000)
IOLoop.instance().start()