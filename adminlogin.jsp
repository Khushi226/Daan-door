<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="org.postgresql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

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
ResultSet rs = null ;
String message= "", dbpswd="";
try { 
Class.forName("org.postgresql.Driver");			// load the driver

String url = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=ntplupl";			// connection url
Connection conn = DriverManager.getConnection(url);

Statement stmt = conn.createStatement() ; 


String eMail= request.getParameter("email") ; 
String password= request.getParameter("password") ; 


String sql = "select password from users where email='"+eMail+"'"; 


System.out.println(sql) ; 
rs = stmt.executeQuery(sql) ; 
//if(rs==null && ){
	
if(rs!=null && rs.next()){ 
	dbpswd=rs.getString(1); 
	if(dbpswd.equals(password)){ 
		message="Password Verified.";
		response.sendRedirect("AdminIndex.html");
	}else {
		message="password not matched"; 
	}
    }
    else {
	message="User does not exist.";
	System.out.println(message) ; 
	}
 }
catch(Exception e) { 
e.printStackTrace() ; 
}

%>


<html><head><title>LOGIN</title></head><body><h1>Login Status</h1>

<p> <%=message%> </p>
</body></html>