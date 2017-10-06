import twitter
import mysql.connector
#Setting up Twitter API
api = twitter.Api(
	consumer_key='FKWBZAO66yXvWgxOww8A',
	consumer_secret='iIWXcZMmMgilaeWmyUN7w0ZWZeBJbi51JZTRJNCaiA',
	access_token_key='171342779-FdZ3BoZawLH5334m9WViFIn5xX1cN9DbBvG8YQUN',
	access_token_secret='iAxTHoIBcjL2LMS5SX5jEv33gBs9yvGbmFItzspb7E'
)



vip_list = ["John Gannon","Todd Catlette","Mike Brown","Mat cain","Mark Zuckerberg","Shashi Bhushan Kumar","Doug Matthews"," Mark Zuckerberg","Bill Gates"]

def twitter_data(product):
    search = api.GetSearch(term=product, result_type='mix', count=10, max_id='')
    for t in search:
         influence_score = 0
         tweet_score = 0
         '''print t.user.name + ' (' + t.created_at + ')'
         #Add the .encode to force encoding
         print t.text.encode('utf-8')
         print ''
         #printing the no of retweets.
         print "no of retweets"
         print t.retweet_count
         #print "no of favorites"
         #print t.favourites_count
         #print "\n No of comments: "
         #print t.in_reply_to_status_id
         if t.user.name in vip_list:
          influence_score = 5
          print t.user.name + 'is influential'
         tweet_score  = t.retweet_count*2 + influence_score
         print "tweet score is"
         print tweet_score
         print "tweet_id : "
         print t.id
         print "influence_score:" 
         print influence_score
         '''
         t.text = t.text.replace("'","")
         t.text = t.text.encode('utf-8').replace("\\x","")
         t.user.name = t.user.name.replace("'","")
         query = "replace into p_tweetdata (tweet_id,tweet_desc,no_of_comments,no_of_favs,retweets,tag,date_of_post,author,influence_flag) values ("+str(t.id)+",'"+str(t.text)+"',"+str(0)+","+str(0)+","+str(t.retweet_count)+",'"+str(product)+"','"+str(t.created_at)+"','"+str(t.user.name.encode('utf-8'))+"',"+str(influence_score)+");"
         cursor.execute(query)
         #send the tweet parameters to db -
    #print "no of tweets:"
    #print len(search)



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
    twitter_data(row[0])
cnx.commit()
cnx.close()
