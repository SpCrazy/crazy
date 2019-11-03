from tornado.web import RequestHandler, Application
from tornado.ioloop import IOLoop


class GreetHandler(RequestHandler):

    def initialize(self,greet):  #每次请求都会调用该initialize方法
        self.greet = greet

    def get(self, name):
        self.write("<h3>" + name + "," + self.greet + "</h3>")


app = Application([
    (r'/greet/([a-zA-Z0-9]+)/', GreetHandler, {"greet": "吃了吗？"})
])


app.listen(8000)
IOLoop.instance().start()