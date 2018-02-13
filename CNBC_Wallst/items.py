# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html


import scrapy


class CNBC_WallstItem(scrapy.Item):
    # define the fields for your item here like:
    Date = scrapy.Field()
    Title = scrapy.Field()
    