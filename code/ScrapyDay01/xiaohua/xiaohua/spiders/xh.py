# -*- coding: utf-8 -*-
import scrapy


class XhSpider(scrapy.Spider):
    name = 'xh'
    allowed_domains = ['www.xiaohuar.com/2014.html']
    start_urls = ['http://www.xiaohuar.com/2014.html']

    def parse(self, response):
        item_selectorlist = response.css("div#images>div.items")
        for item_selector in item_selectorlist:
            item = {}
            pic_src = item_selector.xpath("div/a/img/@src").get()
            name = item_selector.xpath("p/a/text()").get()
            ticket = item_selector.xpath("span/text()").get()
            item["pic_src"] = pic_src
            item["name"] = name
            item["ticket_count"] = ticket
            yield item
