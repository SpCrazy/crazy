from rest_framework.exceptions import APIException

class AXFException(APIException):
    def __init__(self,msg):
        self.detail = msg