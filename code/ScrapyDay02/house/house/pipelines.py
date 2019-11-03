# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html
import json


class HousePipeline(object):
    def open_spider(self,spider):
        print("Spider打开了........")
        self.file = open('house.txt','w')

    def process_item(self, item, spider):
        house_str = json.dumps(dict(item),ensure_ascii=False)
        self.file.write(house_str+"\n")
        return item

    def close_spider(self,spider):
        print("Spider关闭了！")
        self.file.close()