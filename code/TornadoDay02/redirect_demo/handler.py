import os

from tornado.web import RequestHandler, Application, url
from tornado.ioloop import IOLoop

class HelloHandler(RequestHandler):

    def get(self, *args, **kwargs):
        print("hello")
        self.redirect(self.reverse_url("wel"))


class WelcomeHandler(RequestHandler):

    def get(self,):
        print("welcome")
        self.render("welcome.html")



settings = {
    "template_path":os.path.join(os.getcwd(),"templates"),
    "debug":True
}

app = Application([
    url(r'/hello/',HelloHandler,name="h"),
    url(r'/welcome/',WelcomeHandler,name="wel"),
],**settings)

app.listen(8000)
IOLoop.instance().start()