<html>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.*"%>
<%
    String user = request.getParameter("username");   
    String pwd = request.getParameter("password");

	session.setAttribute( "theName", user );
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webcrawl",
            "root", "root123");
    Statement st = con.createStatement();



String paged="";
String query = "select username,passwrd from login_r";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){

String uname=rs.getString(1);
String password = rs.getString(2);
         	
         
if(uname.equals(user) && password.equals(pwd))
{
	
	paged="home.jsp" ;

 
	break;     
}
else
{
paged="error.jsp"   ;
}
}
response.sendRedirect(paged);
%></html>
