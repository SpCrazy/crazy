# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


class AjaxDoubanPipeline(object):
    def process_item(self, item, spider):
        with open("movies.txt","a") as f:
            f.write(item["movie_name"])
            f.write("\n")
        return item
