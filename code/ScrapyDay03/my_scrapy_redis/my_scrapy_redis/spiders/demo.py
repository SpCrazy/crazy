# -*- coding: utf-8 -*-
import scrapy
from scrapy.http import HtmlResponse
from scrapy_redis.spiders import RedisSpider


class DemoSpider(RedisSpider):
    name = 'demo'
    redis_key = "demospider:start_url"

    def parse(self, response:HtmlResponse):
        print("URL是：",response.url)
