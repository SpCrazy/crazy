#接口类型：互亿无线触发短信接口，支持发送验证码短信、订单通知短信等。
#账户注册：请通过该地址开通账户http://sms.ihuyi.com/register.html
#注意事项：
#（1）调试期间，请用默认的模板进行测试，默认模板详见接口文档；
#（2）请使用APIID（查看APIID请登录用户中心->验证码短信->产品总览->APIID）及 APIkey来调用接口；
#（3）该代码仅供接入互亿无线短信接口参考使用，客户可根据实际需要自行编写；

#coding:utf-8
import requests

from util.error import XiaomiException
from util.send_email_captcha import get_captcha


class SendMsg(object):
    def __init__(self):
        self.url = "http://106.ihuyi.com/webservice/sms.php?method=Submit"
        #APIID
        self.account = "C76187802"
        #APIkey
        self.password = "8f31b69c3a4ba3fb99c61821c0caa26c"

    def send_msg_mobile(self, mobile):
        code = get_captcha()
        content = "您的验证码是：" + code + "。请不要把验证码泄露给其他人。"
        #定义请求的头部
        headers = {
            "Content-type": "application/x-www-form-urlencoded",
            "Accept": "text/plain"
        }
        #定义请求的数据
        data = {
            "account": self.account,
            "password": self.password,
            "mobile": mobile,
            "content": content,
        }
        #发起数据
        response = requests.post(self.url,headers = headers,data=data)
            #url 请求的地址
            #headers 请求头部
            #data 请求的数据
        if response:

            print(response.content.decode())
            return code
        else:
            raise XiaomiException({"code": 400, "msg": "短信获取失败"})