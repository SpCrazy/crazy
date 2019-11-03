import os

from tornado.web import RequestHandler, Application, StaticFileHandler
from tornado.ioloop import IOLoop

class IndexHandler(RequestHandler):
    def get(self, *args, **kwargs):
        self.render('show_girl.html')

settings = {
    "template_path":os.path.join(os.getcwd(),"templates"),
    "debug":True,
    "static_url_prefix":"/xyz/",
    "static_path":os.path.join(os.getcwd(),'mystatic'),
}

app = Application([
    (r'/index/',IndexHandler),
    (r'/abc/(.*)',StaticFileHandler,{"path":os.path.join(os.getcwd(),'mystatic')})
],**settings)

app.listen(8000)
IOLoop.instance().start()