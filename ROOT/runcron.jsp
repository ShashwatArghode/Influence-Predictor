<html>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.util.*"%>
<%
    String url = request.getParameter("newurl");   
    
%>

<h1>Hello, <%= session.getAttribute( "theName" ) %></h1>
<%

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webcrawl",
            "root", "root123");
    Statement st = con.createStatement();
    //ResultSet rs;



int i=0;
int j=0;


i = st.executeUpdate("insert into p_datasource(website_url) values ('" + url + "')");

String useris=(String)session.getAttribute( "theName" ) ;

j = st.executeUpdate("insert into p_user_datasource(username, website_url) values ('" + useris + "','" + url + "')");


if (i > 0 && j>0) 
{

ProcessBuilder processBuilder = new ProcessBuilder("python", "C:\\xampp\\tomcat\\webapps\\ROOT\\crawl_social.py",url);
    processBuilder.redirectErrorStream(true);
    final Process process = processBuilder.start();

    InputStream stderr = process.getInputStream();
    InputStreamReader isr = new InputStreamReader(stderr);
    BufferedReader br = new BufferedReader(isr);
    String line = null;


    while ((line = br.readLine()) != null) {
        System.out.println(line);

    }
    process.waitFor();
    System.out.println("Waiting ...");

    System.out.println("Returned Value :" + process.exitValue());    

    }
 else {
        response.sendRedirect("error.jsp");
    }

response.sendRedirect("home.jsp");
}
%></html>
