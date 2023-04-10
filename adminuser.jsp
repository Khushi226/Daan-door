<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="org.postgresql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>

<% 

/*
CREATE TABLE users
(
 uid INT GENERATED ALWAYS AS IDENTITY,
   name character varying(100),
  mobile character varying(10),
  email character varying(100),
  password character varying(100)
  
)
*/ 

try { 
Class.forName("org.postgresql.Driver");			// load the driver

String url = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=ntplupl";			// connection url
Connection conn = DriverManager.getConnection(url);

Statement stmt = conn.createStatement() ; 

String pName = request.getParameter("name") ; 
String mobile= request.getParameter("num") ; 
String eMail= request.getParameter("email") ; 
String password= request.getParameter("password") ; 


String sql = "insert into users (name,mobile,email,password) " + 
"values ( '" + pName + "', '" +mobile+"','"+ eMail+"','"+password+"' ) " ; 

System.out.println(sql) ; 
stmt.executeUpdate(sql) ; 


 }
catch(Exception e) { 
e.printStackTrace() ; 
}

%>


<html><head><title>Registration</title></head><body><h1>Registration Status</h1>

<p><b>User Registered Successfully</b> <%=request.getParameter("name")%> 
 
</p></body></html>