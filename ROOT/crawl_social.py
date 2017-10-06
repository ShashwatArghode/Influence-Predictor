# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.

import os
# Crawl for https://symantec.com by default always.

os.system("cd C:\\xampp\\tomcat\\webapps\\ROOT\\scrapy\\Links && scrapy crawl norton -a datasource=\"https://www.symantec.com\" >> links.txt")
os.system("cd C:\\xampp\\tomcat\\webapps\\ROOT\\scrapy\\Links && scrapy crawl netbackup -a datasource=\"https://www.symantec.com\" >> links.txt")
os.system("cd C:\\xampp\\tomcat\\webapps\\ROOT\\scrapy\\Links && scrapy crawl storage -a datasource=\"https://www.symantec.com\" >> links.txt")
os.system("cd C:\\xampp\\tomcat\\webapps\\ROOT\\scrapy\\Links && scrapy crawl endpoint -a datasource=\"https://www.symantec.com\" >> links.txt")
os.system("perl C:\\xampp\\tomcat\\webapps\\ROOT\\searchblog.pl \"C:\\xampp\\tomcat\\webapps\\ROOT\\scrapy\\Links\\links.txt\" \"https://www.symantec.com\"")


# twitter scrapper.
os.system("python C:\\xampp\\tomcat\\webapps\\ROOT\\twittertest.py")

# facebook scrapper.
os.system("python C:\\xampp\\tomcat\\webapps\\ROOT\\fbtest.py")
