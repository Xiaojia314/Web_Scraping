import scrapy
from scrapy import Spider, Request
from scrapy.selector import Selector
from CNBC_Wallst.items import CNBC_WallstItem


class CNBC_WallstSpider(Spider):
    name = "CNBC_Wallst_spider"
    # allowed_urls = ['https://www.cnbc.com/']
    # start_urls = ['https://www.cnbc.com/finance/?page=1'] #+ str(20*i) for i in range(112)]

    def start_requests(self):
        url = 'https://www.cnbc.com/jobs/?page={}'
        for i in range(1, 76):
            yield scrapy.Request(url=url.format(i), callback=self.parse)

    def parse(self, response):
            print('*************')
            print(response.url)
            for tag in response.xpath('//*[@id="pipeline_assetlist_0"]/li'):
                title = tag.xpath('./div/div/a/text()').extract_first()
                date = tag.xpath('./div/time/text()').extract_first()
                if title is None or date is None:
                    continue
                item = CNBC_WallstItem()
                item['Date'] = date.strip()
                item['Title'] = title.strip()

                yield item

        # for i in range(1, len(rows), 2):
        #     Date = rows[i].xpath('').extract_first()
        #     Title = rows[i].xpath('./a[@class="headline"]/@href').extract_first()
            

        