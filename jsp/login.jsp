<!-- action="login.jsp"-->
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
 <head>
  <title> jsp page </title>
 </head>
     
       <h1>jsp page</h1>
	<% 
	int flag=0;
	String username=request.getParameter("1username");
	String password=request.getParameter("1password");
	try
	{

	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/postgres","postgres","cse");
	Statement ps=con.createStatement();
	ResultSet rs=ps.executeQuery("select  email,password from people");
	out.println("Resulye set executed");
	while(rs.next())
	{
		if((rs.getString(1).equals(username)) && (rs.getString(2).equals(password)))
		{
			flag=1;
		}
		
	} 
	if(flag==1)
	{
        out.println("valid user");
        out.println("<h2><a href="start.html">contact-form</a></h2>")
	}
	else
	{	out.println("Invalid User");
	}

	 }
	catch(Exception e)
	{
	     out.println(e);
	    e.printStackTrace();
	}
out.close();
%>
  
</html>
