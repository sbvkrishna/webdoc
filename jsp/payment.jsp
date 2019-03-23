<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
 <head>
  <title> jsp page </title>
 </head>
     
       <h1>jsp page</h1>
	<% 
	int flag=0;
	String username=request.getParameter("uname");
	String cardno=request.getParameter("cn");
        String cvv=request.getParameter("cvv");
String pin=request.getParameter("pin");
String rpin=request.getParameter("rpin");
	try
	{

	Class.forName("org.postgresql.Driver");
	Connection con=DriverManager.getConnection(
	"jdbc:postgresql://localhost:5432/postgres","postgres","cse");
	Statement ps=con.createStatement();
	ResultSet rs=ps.executeQuery("select  * from credit");
	out.println("Resulye set executed");
	while(rs.next())
	{
		if((rs.getString(1).equals(username)) && (rs.getString(2).equals(cardno))&& (rs.getString(3).equals(cvv))&& (rs.getString(4).equals(pin))&& (rs.getString(5).equals(rpin)))
		{
			flag=1;
		}
		
	} 
	if(flag==1)
	{
		out.println("transaction succesful");
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
