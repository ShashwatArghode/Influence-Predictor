# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.

import scrapy
import json
import sys
from scrapy.http import Request
from Links.items import DSItem
from  __builtin__ import any as b_any


class DSSpider(scrapy.Spider):
    name = "netbackup"
    allowed_domains = []
    args=sys.argv[3]
    args2=args.split('=')
    start_urls = [
        args2[1]
    ]
    item = DSItem()
    specific=[]
    links=[]
    links2=[]
    def parse(self, response):
        '''if (self.start_urls[0].endswith(".com")!=0):
            print "wrong data source."
           ''' 
        for sel in response.xpath('//ul/li'):
            

            '''
            1. get all the links as they are.
            '''

            title=sel.xpath('a/text()').extract()
            url = sel.xpath('a/@href').extract()

            '''
            2. now for each link, get only those whose titles match the product name[0]
            '''
            products = []
            products.append("NetBackup")

            
            if( b_any(products[0] in x for x in sel.xpath('a/text()').extract())):
                '''
                now check if link is relative, if yes append the domain name and then change it in specific.
                '''
                if ( url[0].find("http") == -1):
                    url[0]= self.start_urls[0]+url[0]


                self.item['url'] = url
                self.item['title']=title
                self.specific.append(url)
                self.links.append(self.item['url'][0]+','+self.item['title'][0])          
        

        
        self.links2.append(len(self.specific))
        self.links2.append(products[0])
        for link in self.links:
            self.links2.append(link)

        for data in self.links2:
            print data
