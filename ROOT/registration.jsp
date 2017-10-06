<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.util.*"%>
<%
    String user = request.getParameter("uname");   
    String pwd = request.getParameter("pass");
    String email = request.getParameter("email");
    String norton = request.getParameter("symc1");   
    String netbackup = request.getParameter("symc2");
    String storage = request.getParameter("symc3");
    String endpoint = request.getParameter("symc4");
    String subscribe = request.getParameter("subscribe");



    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webcrawl",
            "root", "root123");
    Statement st = con.createStatement();
    //ResultSet rs;



int i=0;
int j=0;
try
{
if(subscribe!=null)
{
    i = st.executeUpdate("insert into p_login(username, passwrd, email, subscribe_flag) values ('" + user + "','" + pwd + "','" + email + "',1)");
}
else
{
i = st.executeUpdate("insert into p_login(username, passwrd, email, subscribe_flag) values ('" + user + "','" + pwd + "','" + email + "',0)");
}
String symc="http://www.symantec.com";
i = st.executeUpdate("replace into p_datasource(website_url) values ('"+symc+"')");



i = st.executeUpdate("insert into p_user_datasource(username, website_url) values ('" + user + "','"+symc+"')");

if(norton!=null)
{

j= st.executeUpdate("insert into p_user_product(username, prod_id) values ('" + user + "',1)");
}
if(netbackup!=null)
{

j= st.executeUpdate("insert into p_user_product(username, prod_id) values ('" + user + "',2)");
}

if(storage!=null)
{

j= st.executeUpdate("insert into p_user_product(username, prod_id) values ('" + user + "',3)");
}

if(endpoint!=null)
{

j= st.executeUpdate("insert into p_user_product(username, prod_id) values ('" + user + "',4)");
}
if (i>0)
{
ProcessBuilder processBuilder = new ProcessBuilder("python", "C:\\xampp\\tomcat\\webapps\\ROOT\\crawl_cronjob.py");
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
catch(Exception e)
{
response.sendRedirect("home.jsp");
}
%></html>
