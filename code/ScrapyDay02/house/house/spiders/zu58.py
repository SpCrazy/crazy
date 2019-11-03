# -*- coding: utf-8 -*-
import scrapy
from scrapy.http import HtmlResponse

from ..items import HouseItem


class Zu58Spider(scrapy.Spider):
    name = 'zu58'
    allowed_domains = ['xa.58.com']
    start_urls = ['https://xa.58.com/chuzu/']

    def parse(self, response:HtmlResponse):
        li_selectorlist = response.xpath('//ul[@class="house-list"]/li')
        for li_selector in li_selectorlist:
            item = HouseItem()
            house_name = li_selector.xpath('div[2]/h2/a/text()').get()
            house_price = li_selector.xpath('div[3]//b/text()').get()
            item["name"] = str(house_name).strip()
            # item["price"] = house_price
            yield item
