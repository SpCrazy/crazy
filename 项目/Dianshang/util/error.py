from rest_framework.exceptions import APIException


class HuaweiException(APIException):
    def __init__(self,msg):
        self.detail = msg