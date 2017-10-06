# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.

import os
# Crawl for https://symantec.com by default always.
import sys
ds=sys.argv[1]

norton="cd C:\\xampp\\tomcat\\webapps\\ROOT\\scrapy\\Links && scrapy crawl norton -a datasource="+ds
norton=norton+" >> cron.txt"
endpoint="cd C:\\xampp\\tomcat\\webapps\\ROOT\\scrapy\\Links && scrapy crawl endpoint -a datasource="+ds
endpoint=endpoint+" >> cron.txt"
backup="cd C:\\xampp\\tomcat\\webapps\\ROOT\\scrapy\\Links && scrapy crawl netbackup -a datasource="+ds
backup=backup+" >> cron.txt"
storage="cd C:\\xampp\\tomcat\\webapps\\ROOT\\scrapy\\Links && scrapy crawl storage -a datasource="+ds
storage=storage+" >> cron.txt"



os.system(norton)
os.system(backup)
os.system(storage)
os.system(endpoint)
os.system("perl C:\\xampp\\tomcat\\webapps\\ROOT\\searchblog.pl \"C:\\xampp\\tomcat\\webapps\\ROOT\\scrapy\\Links\\cron.txt\" "+ds)
