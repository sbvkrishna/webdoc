<!-- action="login.jsp"-->
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
 <head>
  <title> jsp page </title>
 </head>
    <body>
    <h1>jsp page</h1>
	<% 
	int flag=0;
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	try
	{
		
		Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","cse");
	Statement ps=con.createStatement();
	ResultSet rs=ps.executeQuery("select  email,password from people");
	//out.println("Result set executed");
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
        out.println("<h2><a href='views/start.html'>contact-form</a></h2>");
	}
	else
	{	out.println("Invalid User");
	//out.println(username+"  "+password);
	}

	 }
	catch(Exception e)
	{
		out.println("out of scope error");
	     out.println(e);
	    e.printStackTrace();
	}
out.close();
%>
</body> 
</html>
