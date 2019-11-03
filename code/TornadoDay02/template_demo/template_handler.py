import os

from tornado.web import RequestHandler, Application
from tornado.ioloop import IOLoop


class TemplateHandler(RequestHandler):

    def get(self, *args, **kwargs):
        s = "hello"
        fruits = ["apple","orange","banana","watermelon"]
        mydict = {"name":"jack","age":26}
        danger = "<script>alert('大笨蛋')</script>"
        self.render('welcome.html',s=s,fruits=fruits,mydict=mydict,danger=danger)

settings = {
    "template_path":os.path.join(os.getcwd(),"templates"),
    "debug":True
}

app = Application([
    (r'/t/',TemplateHandler)
],**settings)

app.listen(8000)
IOLoop.instance().start()