# -*- coding: utf-8 -*-
import scrapy
from scrapy.http import HtmlResponse

from ..items import AjaxDoubanItem


class DbSpider(scrapy.Spider):
    name = 'db'
    allowed_domains = ['movie.douban.com']
    start_urls = ['https://movie.douban.com/typerank?type_name=%E5%8F%A4%E8%A3%85&type=30&interval_id=100:90&action=']


    def parse(self, response:HtmlResponse):
        # print("响应内容：")
        # with open("rank.txt", "wb") as f:
        #     f.write(response.body)
        # print("写入成功")
        names_selectorlist = response.xpath('//div[@class="movie-content"]//div[@class="movie-name"]//a/text()')
        for name in names_selectorlist.extract():
            item = AjaxDoubanItem()
            item["movie_name"] = name
            yield item