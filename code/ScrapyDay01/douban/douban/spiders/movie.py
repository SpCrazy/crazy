# -*- coding: utf-8 -*-
import scrapy
from scrapy import Request


class MovieSpider(scrapy.Spider):
    name = 'movie'
    allowed_domains = ['movie.douban.com']
    start_urls = ['https://movie.douban.com/top250']

    def parse(self, response):
        movies_selectorlist = response.xpath('//div[@class="hd"]/a/span[1]/text()')
        movies = movies_selectorlist.extract()
        for movie in movies:
            item = {"movie_name": movie}
            yield item

        next_href = response.xpath('//span[@class="next"]/a/@href').get()
        print("next_href=", next_href)
        if next_href:
            next_url = "https://movie.douban.com/top250" + next_href
            yield Request(next_url,callback=self.parse)
