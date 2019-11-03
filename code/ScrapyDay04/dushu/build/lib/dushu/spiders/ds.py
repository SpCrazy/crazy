# -*- coding: utf-8 -*-
import scrapy
from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule


class DsSpider(CrawlSpider):
    name = 'ds'
    allowed_domains = ['dushu.com']
    start_urls = ['https://www.dushu.com/book/1001.html']

    rules = (
        Rule(LinkExtractor(allow=r'book/\d+/'), callback='parse_item'),
    )

    def parse_item(self, response):
        item = {}
        item["book_name"] = response.xpath('//h1/text()').get()
        item["book_price"] = response.xpath('//span[@class="num"]/text()').get()
        item["book_publish"] = response.xpath('//table[1]/tbody/tr[2]/td[2]/a/text()').get()
        return item
