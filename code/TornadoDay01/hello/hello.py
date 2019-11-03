from tornado.ioloop import IOLoop
from tornado.web import RequestHandler, Application


class HelloHandler(RequestHandler):

    def get(self, *args, **kwargs):
        self.write("<h3 style='color:red'>Hello,Tornado</h3>")


app = Application([
    (r'/hello/',HelloHandler),
])


app.listen(8000)   #监听

IOLoop.instance().start()    #启动服务