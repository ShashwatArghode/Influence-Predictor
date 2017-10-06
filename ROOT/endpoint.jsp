<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.*"%>

<html>
<head>

<meta charset="utf-8">

<title>SYMC Crawler</title>

<link href="eCommerceStyle.css" rel="stylesheet" type="text/css">


<script>var __adobewebfontsappname__="dreamweaver"</script>
<script src="http://use.edgefonts.net/montserrat:n4:default;source-sans-pro:n2:default.js" type="text/javascript"></script>

</head>



<body>




<div id="mainWrapper">

  <header> 

    <!-- This is the header content. It contains Logo and links -->

    <div id="logo"> <!-- <img src="logoImage.png" alt="sample logo"> --> 

      <!-- Company Logo text --> 

      LOGO </div>

    <div id="headerLinks"><a href="settings.jsp" title="settings">Hi, <%= session.getAttribute( "theName" ) %></a>
<a href="runjob.jsp" title="runjob">Refresh Feed.</a>

</div>


  </header>

  <section id="offer"> 
  </section>

  <div id="content">

    <section class="sidebar"> 

      <!-- This adds a sidebar with 1 searchbox,2 menusets, each with 4 links -->

      

      <div id="menubar" style="overflow-y: scroll; height:720px; width: 300px;>

        <nav class="menu">

          <h2><!-- Title for menuset 1 -->Twitter</h2>

          <hr>

          <ul>

            <!-- List of links under menuset 1 -->

<%


    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webcrawl",
            "root", "root123");
    Statement st = con.createStatement();

String query = "select distinct tweet_desc,retweets,author from tweetdata_r where tweet_desc not like '%Graham Norton%' and tweet_desc not like '%Edward Norton%' and tweet_desc not like '%ken Norton%' and author not like '%Norton%' and tag='Endpoint Protection' order by retweets desc limit 4 ";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){

String tweetdesc= rs.getString(1);
String retweets= rs.getString(2);
String author= rs.getString(3);



%>
            <li><a>
<%=author%><p>
Tweet:<%=tweetdesc%></p>
Retweets:<%=retweets%>
</a></li>
<p>-----------------------------</p>
<%
}



%>


          </ul>

        </nav>

        <nav class="menu">

          <h2>Facebook</h2>

          <!-- Title for menuset 2 -->

          <hr>

          <ul>

            <!--List of links under menuset 2 -->


<%

Statement st2 = con.createStatement();

String query2 = "select post_desc, url, no_of_likes, no_of_shares, no_of_comments from fbdata_r where tag='Endpoint Protection' order by post_score desc limit 4";
st2 = con.createStatement();
rs = st.executeQuery(query2);
while(rs.next()){

String postdesc= rs.getString(1);
String url= rs.getString(2);
String likes= rs.getString(3);
String shares=rs.getString(4);
String comments=rs.getString(5);


%>
            <li><a>
<%=postdesc%><a href="<%=url%>">Read More...</a><p>
likes: <%=likes%></p>
<p>comments: <%=comments%></p>
<p>shares:<%=shares%></p>
</a></li>
<li>----------------------</li>
<%
}



%>

          </ul>

        </nav>

      </div>

    </section>

    <section class="mainContent">

      <div class="productRow"><!-- Each product row contains info of 3 elements -->

        <article class="productInfo">

          
<div><p>
<%


Statement st3 = con.createStatement();
String user= (String)session.getAttribute( "theName" ) ;
String query3 = "select title,descp,url from blogdata_r a inner join user_datasource_r b on a.mainurl = b.website_url where b.username = '"+user+"' and tag = 'Endpoint Protection' group by descp order by no_of_hits desc limit 3";
st3 = con.createStatement();
rs = st.executeQuery(query3);
while(rs.next()){

String title1= rs.getString(1);
String post1= rs.getString(2);
String link1= rs.getString(3);
%>

<p><%=title1%><p><%=post1%><a href="<%=link1%>">Read more...</a></p></p></p></div>
<%

}

%>




                  </article>

      </div>
    </section>

  </div>

  <footer> 

    <!-- This is the footer with default 3 divs -->

    <div>

      Copyright © <a href="https://www.symantec.com">Symantec</a>
    </div>

  </footer>

</div>

</body>
</html>