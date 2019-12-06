from rest_framework.renderers import JSONRenderer

class AXFRenderer(JSONRenderer):
    def render(self, data, accepted_media_type=None, renderer_context=None):
        try:
            code = data.pop("code")
            msg = data.pop("msg")
        except:
            code = 200
            msg = "success!"

        renderer_context['response'].status_code = 200
        result = {
            "code":code,
            "msg":msg,
            "data":data
        }
        return super().render(result)


