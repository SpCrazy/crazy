import os

from tornado.web import RequestHandler,Application
from tornado.ioloop import IOLoop


class SettingHandler(RequestHandler):

    def get(self, *args, **kwargs):
        self.render('bye.html')

settings = {
    "template_path":os.path.join(os.getcwd(),"templates"),
    "debug":True
}

app = Application([
    (r'/set/',SettingHandler)
],**settings)

app.listen(8000)
IOLoop.instance().start()
