import facebook
import json
import mysql.connector

token = 'CAAF4ZCgDktEIBALPG0G7JSR4hz9e48jVh8OgZC2lSIzYcaOGZCAZAkc4UZBITmHBXjIfdw00Hg2cp1TVMFsU4dsB5UjbvkMVR2rv63dcdY61L21cPqukYDTYzUAPQV1DZAGmPzvL7vG3ewY9uSEsunZCg6LRcwWdnUZBRE4LPOxYCB1ovlmfUlrcnOe9dzE86weIHaafgiJ2WGhcxVN06ibj'


product = "Symantec"
#get the product from the database
	
product_page = {'Symantec Website Security Solutions': '50292378244','Endpoint Protection':'116958583650','Norton': '389686874400888', 'NetBackup': '50792439255','Storage Foundation':'8988037875'}


vip_list = ["John Gannon","Mike Brown","Mat cain","Mark Zuckerberg","Shashi Bhushan Kumar","Doug Matthews"," Mark Zuckerberg","Bill Gates"]

g = facebook.GraphAPI(token)
def fbdata(page_id):
        flike = g.get_connections(page_id, "feed", limit=5)
        posts_count = len(flike['data'])
        #print "posts_count"
        #print posts_count
        for x in range(0, posts_count):
                try:
                        likes_count = len(flike['data'][x]['likes']['data'])
                except KeyError:
                        likes_count =0 
                #print "likes_count"
                #print likes_count
                try:
                        comments_count  = len(flike['data'][x]['comments']['data'])
                except KeyError:
                	comments_count = 0
               # print "comments_count"
                #print comments_count
                try:
                	shares_count = flike['data'][x]['shares']['count'] 
                except KeyError: 
                        shares_count = 0
                #print "shares_count"
                #print shares_count
                #print "post id"
                post_id  = flike['data'][x]['id']
                #print post_id
                #print "post_url"
                post_url = flike['data'][x]['actions'][0]['link'] 
                #print post_url
                post_score = likes_count + comments_count + shares_count*2
                #print "post_score"
                #print post_score
                #print "post description"
                try:
                	post_description = flike['data'][x]['description']
                except KeyError:
                	post_description = " "
                #print post_description
                try:
                	post_name = flike['data'][x]['name']
                except:
                        post_name = " "
                #print "post_name"
                #print post_name
                #print "********************************"
                post_description = post_description.replace("'","")
                if(post_description != ' '):
                        query = "replace into p_fbdata (post_id,post_desc,no_of_comments,no_of_likes,url,no_of_shares,tag,date_of_post,author,influence_flag,post_score) values ('"+str(post_id)+"','"+str(post_description.encode('utf-8'))+"',"+str(comments_count)+","+str(likes_count)+",'"+str(post_url)+"',"+str(shares_count)+",'"+str(product)+"','','',0,"+str(post_score)+");"
                        cursor.execute(query)
#gettting term from db
cnx = mysql.connector.connect(user='root', password='root123',
                              host='127.0.0.1',
                              database='webcrawl')
cursor = cnx.cursor()
query = ("SELECT name from product_r")
cursor.execute(query)
data = cursor.fetchall()
for row in data :
    #print row[0]
    product = row[0]
    #print product
    page_id = product_page[product] 
    #print page_id
    fbdata(page_id)

cnx.commit()	
cnx.close()
print "done"

