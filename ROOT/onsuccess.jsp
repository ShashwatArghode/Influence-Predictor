<<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- head -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="IE=8" http-equiv="X-UA-Compatible" />

<!-- Title of page -->

<title>Welcome To Indo Airlines</title>


<!-- Main CSS Stylesheet -->


<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/jquery.tools/scrollable-horizontal.css" />
<link rel="stylesheet" type="text/css" href="js/jquery.tools/scrollable-buttons.css" />
<link rel="stylesheet" type="text/css" href="js/jquery.tools/scrollable-navigator.css" />


<!-- .JS Files -->

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.tools/jquery.tools.min.js"></script>
<script type="text/javascript" src="js/scripts.js"></script>

<style type="text/css">
#doc3 {
	margin:auto;
	background:url(images/header-bg.jpg) top no-repeat;
}
</style>
</head>

<body>
   
        <br/><br/><br/><br/><br/>
        <center>

<body>
    <%@page language="java"%>
    <%@page import="java.sql.*"%>

    <%

        PreparedStatement ps=null;
        Connection cn=null;
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        cn=DriverManager.getConnection("jdbc:odbc:check1");
        ps=cn.prepareStatement("update check1 set id1='1' ");
    
        ps.executeUpdate();
       %>




            <h2>
            <%
            String a=session.getAttribute("name2").toString();
            out.println("Hello  "+a);
            %>
            </h2>
            <br/>
            <br/>
            <br/><br/><br/><br/><br/>
        <a href="logout.jsp">Logout</a>


<%
String user=session.getAttribute("name2").toString();
String pass=session.getAttribute("password2").toString();
         
        	 if(user.equals("talina") && pass.equals("ccoew"))
             	{
	%>
	<br>
	<br>
	<a href="sdtl/jsp/addflight.html">Edit Flight Database.</a>
	<br>
	<a href="disp.jsp">Check Messages.</a> <br> 
	<a href="sdtl/jsp/upflight.html">Update Flight Database.</a>
	<br>
	<a href="sdtl/jsp/delflight.html">Delete a Flight.</a>
	<br>
<%
	}	     
%>
        </center>
 
    </body>
</html>



