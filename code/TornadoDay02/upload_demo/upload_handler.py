import os

from tornado.web import RequestHandler, Application, url
from tornado.ioloop import IOLoop


class UploadHandler(RequestHandler):

    def get(self, *args, **kwargs):
        self.render('upload.html')

    def post(self, *args, **kwargs):
        upload_file_list = self.request.files["myfile"]
        for up_dict in upload_file_list:
            print("up_dict==",up_dict)
            data = up_dict.get("body")
            filename = up_dict.get("filename")
            dest_path = os.path.join(os.getcwd(),"upload_dir",filename)
            with open(dest_path,'wb') as f:
                f.write(data)
                print(filename+"上传成功")
        self.redirect(self.reverse_url('suc'))

class SuccessHandle(RequestHandler):
    def get(self, *args, **kwargs):
        self.render('success.html')

settings = {
    'template_path':os.path.join(os.getcwd(),"templates"),
    'debug':True,
    'xsrf_cookies':True
}

app = Application([
    url(r'/upload/',UploadHandler,name="up"),
    url(r'/success/', SuccessHandle, name="suc"),

],**settings)

app.listen(8000)
IOLoop.instance().start()