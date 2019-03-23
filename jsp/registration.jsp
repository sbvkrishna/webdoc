<!-- action="registration.jsp" -->
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
 <head>
  <title> jsp page </title>
 </head>
     
       <h1>jsp page</h1>
	<% 
	
	String n=request.getParameter("username");
String e=request.getParameter("email");
String m=request.getParameter("moible");
String p=request.getParameter("password");
String pa=request.getParameter("confirmpassword");
	try
	{

	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/postgres","postgres","cse");
	PreparedStatement ps=con.prepareStatement(
"insert into registration values(?,?,?,?,?)");

ps.setString(1,n);
ps.setString(2,e);
ps.setString(3,m);
ps.setString(4,p);
ps.setString(5,pa);
int i=ps.executeUpdate();

PreparedStatement ps1=con.prepareStatement(
"insert into people values(?,?)");
ps1.setString(1,e);
ps1.setString(2,p);
int k=ps1.executeUpdate();
if(i>0)
{
    out.print("You are successfully registered...");
    out.print("<a href="index.html">Login here</a>");
    //response.sendRedirect("Login.html");
}
if(k>0)
{
out.println("vijaya updated");
}
	}
	catch(Exception er)
	{
	     out.println(er);
	    er.printStackTrace();
	}
out.close();
%>
  
</html>