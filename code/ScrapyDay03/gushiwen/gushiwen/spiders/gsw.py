# -*- coding: utf-8 -*-
import scrapy
from scrapy import Request, FormRequest

from ydm_api import ydm


class GswSpider(scrapy.Spider):
    name = 'gsw'
    allowed_domains = ['so.gushiwen.org']

    def start_requests(self):
        captcha_url = "https://so.gushiwen.org/RandCode.ashx"
        yield Request(captcha_url,callback=self.login)


    def login(self, response):
        with open("captcha.png","wb") as f:
            f.write(response.body)

        code = ydm.get_code("captcha.png")
        print("code=======",code)

        login_url = "https://so.gushiwen.org/user/login.aspx"
        form_data = {
            "email": "492247312@qq.com",
            "pwd": "hjf19930214hjf",
            "code": code
        }
        yield FormRequest(login_url,formdata=form_data,callback=self.after_login)

    def after_login(self,response):
        with open("result.html","wb") as f:
            f.write(response.body)


