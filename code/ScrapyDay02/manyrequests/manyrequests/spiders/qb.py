# -*- coding: utf-8 -*-
import scrapy
from scrapy import Request


class QbSpider(scrapy.Spider):
    name = 'qb'
    allowed_domains = ['www.qiushibaike.com']
    start_urls = ['https://www.qiushibaike.com/text/']

    def parse(self, response):
        author_selectorlist = response.css(".author")
        for author_selector in author_selectorlist:
            item = {}
            src = author_selector.xpath('a[1]/img/@src').get()
            if src:
                item["pic_path"] = "https:" + src
                yield item
                user_url = "https://www.qiushibaike.com" + author_selector.xpath('a[1]/@href').get()
                yield Request(user_url,callback=self.user_parse)

            next_herf = response.xpath('//ul[@class="pagination"]/li[last()]/a/@href').get()
            print("next_herf==", next_herf)
            if next_herf:
                next_url = "http://www.qiushibaike.com" + next_herf
                yield Request(next_url, callback=self.parse)

    def user_parse(self,response):
        item = {}
        item["name"] = response.xpath('//div[@class="user-header-cover"]/h2/text()').get()
        item["job"] = response.xpath('//div[@class="user-statis user-block"][2]/ul/li[last()-2]/text()').get()
        item["home"] = response.xpath('//div[@class="user-statis user-block"][2]/ul/li[last()-1]/text()').get()
        yield item


