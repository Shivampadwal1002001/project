<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%

try{
	Connection con=ConnectionProvider.getCon();
	Statement st= con.createStatement();
	String q1= "create table shop(name varchar(100),email varchar(100) primary key,mobileNumber bigint,securityQuestion varchar(200),answer varchar(200),password varchar(100),city varchar(100),state varchar(100) )";
	
	String q2= "create table product(id int,name varchar(500),category varchar(200),price int)";
	
	//st.execute(q1);
	st.execute(q2);
	System.out.print("table created");
	con.close();
}
catch(Exception e)
{
	System.out.print(e);
}


%>