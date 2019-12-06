from rest_framework.exceptions import APIException


class XiaomiException(APIException):
    def __init__(self,msg):
        self.detail = msg