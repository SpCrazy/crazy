# -*- coding: utf-8 -*-
import scrapy
from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule


class JobSpider(CrawlSpider):
    name = 'job'
    allowed_domains = ['www.zhipin.com']
    start_urls = ['https://www.zhipin.com/?sid=sem_pz_bdpc_dasou_title']

    rules = (
        Rule(LinkExtractor(allow=r'/[0-9a-zA-Z]+-[0-9a-zA-Z]+/',restrict_css="div.job-menu>dl>dd"), callback='parse_item', follow=True),
    )

    def parse_item(self, response):
        item = {}
        jobs = response.css("div.job-title").xpath("text()").extract()
        salaries = response.css("div.info-primary").xpath('h3/a/span/text()').extract()
        companies = response.css("div.company-text").xpath('h3/a/text()').extract()
        for i in range(len(jobs)):
            item["job"] = jobs[i]
            item["salary"] = salaries[i]
            item["company"] = companies[i]
            yield item
