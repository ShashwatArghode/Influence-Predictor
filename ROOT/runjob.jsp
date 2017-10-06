<!doctype html>

<html>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.*"%>


<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webcrawl",
            "root", "root123");
    Statement st = con.createStatement();

String user= (String)session.getAttribute("theName");


String ds = "select website_url from user_datasource_r where username='"+user+"'";
	st = con.createStatement();
	ResultSet rs2 = st.executeQuery(ds);

while(rs2.next())
{

String source=rs2.getString(1);
	ProcessBuilder processBuilder = new 


ProcessBuilder("python", "C:\\xampp\\tomcat\\webapps\\ROOT\\crawl_cronjob.py ", source);

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

    System.out.println("Returned Value :" + 	process.exitValue());



ProcessBuilder processBuilder2 = new ProcessBuilder("python", "C:\\xampp\\tomcat\\webapps\\ROOT\\crawl_social.py");
    processBuilder.redirectErrorStream(true);
    final Process process2 = processBuilder.start();

    InputStream stderr2 = process2.getInputStream();
    InputStreamReader isr2 = new InputStreamReader(stderr2);
    BufferedReader br2 = new BufferedReader(isr2);
    String line2 = null;


    while ((line2 = br2.readLine()) != null) {
        System.out.println(line2);

    }
    process2.waitFor();
    System.out.println("Waiting ...");

    System.out.println("Returned Value :" + 	process2.exitValue());        
}
%>

</html>

