<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.*"%>

<html>
<head>

<meta charset="utf-8">

<title>SYMC Crawler</title>

<link href="eCommerceStyle.css" rel="stylesheet" type="text/css">



<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->

<script>var __adobewebfontsappname__="dreamweaver"</script><script src="http://use.edgefonts.net/montserrat:n4:default;source-sans-pro:n2:default.js" type="text/javascript"></script>

</head>



<body>




<div id="mainWrapper">

  <header> 

    <!-- This is the header content. It contains Logo and links -->

    <div id="logo"> 

      <!-- Company Logo text --> 

      <img src="images/Symantec_logo_horizontal_2010-1.png" alt="sample" width="300" height="78"> </div>

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

String query = "select distinct tweet_desc,retweets,author from tweetdata_r where tweet_desc not like '%Graham Norton%' and tweet_desc not like '%Edward Norton%' and tweet_desc not like '%ken Norton%' and author not like '%Norton%' order by retweets desc limit 4 ";
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

String query2 = "select post_desc, url, no_of_likes, no_of_shares, no_of_comments from fbdata_r order by post_score desc limit 4";
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

        <article class="productInfo"><!-- Each individual product description -->

          <div><img alt="sample" src="images/Norton-AntiVirus-Android-Logo.png"></div>

          <p class="price"><a href="norton.jsp" title="Norton" style="color:black">Norton</a></p>
        </article>

        <article class="productInfo"><!-- Each individual product description -->

          <div><img alt="sample" src="images/Symantec-Patches-Veritas-NetBackup-6-0-PureDisk-2.jpg"></div>

          <p class="price"><a href="netbackup.jsp" title="NetBackup" style="color:black">NetBackup</a></p>
        </article>

        

      </div>

      <div class="productRow"> 

        <!-- Each product row contains info of 3 elements -->
<article class="productInfo"> <!-- Each individual product description -->

          <div><img alt="sample" src="images/SYMANTEC_IS_IMAGE_LOCKUP_Storage_Software.png"></div>

          <p class="price"><a href="storage.jsp" title="Storage Foundation" style="color:black">Storage Foundation</a></p>
        </article>

        <article class="productInfo"> <!-- Each individual product description -->

          <div><img alt="sample" src="images/Symantec-Endpoint-Protection-Small-Business-Edition-12.1.1000.157-7573.png"></div>

          <p class="price"><a href="endpoint.jsp" title="Endpoint Protection" style="color:black">Endpoint Protection</a></p>
        </article>

      </div>
    </section>

  </div>

  <footer> 

    <!-- This is the footer with default 3 divs -->

    <div>

      <p style="color:black">Copyright</p>
      <a href="https://www.symantec.com"><p style="color:black">symantec</p></a>    
    </div>

  </footer>

</div>

</body>
</html>

