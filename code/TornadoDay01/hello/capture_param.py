from tornado.ioloop import IOLoop
from tornado.web import RequestHandler, Application


class WelcomeHandler(RequestHandler):

    def get(self,name):
        self.write("<h3>欢迎，<span style='color:blue'>" + name + "</span></h3>")

app = Application([
    (r'/wel/(?P<name>\w+)/',WelcomeHandler),
])

app.listen(address="localhost",port=8000)

IOLoop.instance().start()