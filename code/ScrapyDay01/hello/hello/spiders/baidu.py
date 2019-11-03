# -*- coding: utf-8 -*-
import scrapy
from scrapy.http import HtmlResponse


class BaiduSpider(scrapy.Spider):
    name = 'baidu'
    allowed_domains = ['www.baidu.com']
    start_urls = ['http://www.baidu.com/']

    def parse(self, response:HtmlResponse):
        print("response的类型：",type(response))
        yield {"name": "张无忌", "age": 25, "score": 91.5}

